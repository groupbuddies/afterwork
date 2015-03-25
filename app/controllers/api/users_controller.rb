module API
  class UsersController < API::ApplicationController
    def me
      authorize! :show, current_user

      render json: current_user
    end
  end
end
