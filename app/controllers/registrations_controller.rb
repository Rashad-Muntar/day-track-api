class RegistrationsController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = user_id
            render json: {status: created, user: @user}
        else
            render json: {erro: "Ooops something is wrong"}
        end
    end

    private
    def user_params
        param.require(:user).permit(:email, :name)
    end
end
