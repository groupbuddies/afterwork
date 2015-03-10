class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter]
  has_many :attendances
  has_many :availabilities, dependent: :destroy

  validates :name, presence: true

  acts_as_taggable_on :interests

  accepts_nested_attributes_for :availabilities

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      config_attributes(user, auth)
    end
  end

  def email_required?
    super && provider.blank?
  end

  def self.config_attributes(user, auth)
    user.name = auth.info.name
    user.password = Devise.friendly_token[0, 20]
    user.image = auth.info.image
    user.screen_name = auth.info.nickname
  end
end
