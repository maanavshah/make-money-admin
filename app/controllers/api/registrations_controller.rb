class Api::RegistrationsController < Api::BaseController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.new
    user.first_name = params[:first_name].presence
    user.last_name = params[:last_name].presence
    user.email = params[:email].presence
    user.password = params[:password].presence
    user.password_confirmation = params[:confirm_password].presence
    code_flag = true
    while code_flag
      new_referral_code = ALPHAS.sample(5).join + NUMS.sample(5).join
      code_flag =  User.where(referral_code: new_referral_code).any?
    end
    user.referral_code = new_referral_code
    if user.save
      render json: "User registered successfully, please confirm your email id!", status: 201
    else
      warden.custom_failure!
      render json: user.errors.full_messages.uniq.to_sentence, status: 422
    end
  end
end
