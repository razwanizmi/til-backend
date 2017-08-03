module Api
  class UsersController < Api::ApplicationController
    before_action :authenticate_user, only: [:show]

    def create
      @user = User.new(user_params)
      return head :no_content unless @user.save
      render json: @user, status: :created
    end

    def show
      @user = User.find_by(id: params[:id])
      return head :no_content unless @user.present?
      render json: @user, status: :ok
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
