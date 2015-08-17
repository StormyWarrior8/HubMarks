class Api::SessionsController < ApplicationController


  def destroy
    sign_out!(current_user)
    render json: {}
  end

  def omniauth
    user = User.find_or_create_by_auth_hash(auth_hash)
    sign_in!(user)
    redirect_to root_url
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end

end
