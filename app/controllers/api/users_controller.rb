class Api::UsersController < Api::BaseController
  skip_before_action :verify_authenticity_token, only: %i[get_coins set_coins get_config]

  def get_coins
    user = User.find_by_email(params[:email])
    if user.present?
      render json: user.coins.to_s, status: 200
    else
      render json: -1.to_s, status: 422
    end
  end

  def set_coins
    coins = params[:coins].presence.to_i
    user = User.find_by_email(params[:email])
    if user.present? && user.update_attribute(:coins, coins)
      render json: user.coins.to_s, status: 200
    else
      render json: -1.to_s, status: 422
    end
  end

  def get_config
    app_config = AppConfig.find_by_key(params[:name].presence.to_s)
    if app_config.present?
      render json: app_config.value, status: 200
    else
      render json: '', status: 422
    end
  end
end
