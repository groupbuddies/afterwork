class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  attr_reader :user

  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if request.env['omniauth.params']['type'].eql?("web")
      sign_in_or_create_user
    else
      render 'token_post_message', layout: false
    end
  end

  private

  def sign_in_or_create_user
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'twitter') if is_navigational_format?
    else
      session['devise.twitter_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url
    end
  end
end
