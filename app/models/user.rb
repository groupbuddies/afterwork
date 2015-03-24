class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter]
  has_many :attendees
  has_many :availabilities, dependent: :destroy

  validates :name, presence: true

  acts_as_taggable_on :interests

  accepts_nested_attributes_for :availabilities

  before_save :ensure_authentication_token

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      config_attributes(user, auth)
    end
  end

  def email_required?
    super && provider.blank?
  end

  def self.user_name(user_id)
    User.find(user_id).name
  end

  def self.image_profile(user_id)
    User.find(user_id).image
  end

  def self.users_available(start_date)
    User.all.select do |user|
      user.availabilities.any? do |availability|
        availability.include?(start_date)
      end
    end
  end

  def self.config_attributes(user, auth)
    user.name = auth.info.name
    user.password = Devise.friendly_token[0, 20]
    user.image = auth.info.image
    user.screen_name = auth.info.nickname
  end

  def ensure_authentication_token
    return unless authentication_token.blank?

    self.authentication_token = generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = SecureRandom.urlsafe_base64(nil, false)
      break token unless User.where(authentication_token: token).first
    end
  end
end
