class Api::SessionsController < Api::BaseController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by_email(params[:email])
    if user.present?
      if user.confirmed?
        if user.valid_password?(params[:password])
          render json: 'Login successful!', status: :ok
        else
          invalid_login_attempt('Invalid password. Please try again!')
        end
      else
        invalid_login_attempt('Please confirm your account!')
      end
    else
      invalid_login_attempt('Invalid email. Please try again!')
    end
  end

  def destroy
    sign_out(resource_name)
  end

  protected

  def invalid_login_attempt(message)
    warden.custom_failure!
    render json: message, status: 401
  end
end
