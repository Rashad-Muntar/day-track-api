class SessionsController < ApplicationController

    before_action: current_user

    def create
        @user = User.find_by(name: params[:name])
        if @user
            session[user_id] = user.id
            render json: {status: :created, logged_in: true, user: @user}
        else
            render json: {status: 401}
    end

    def logged_in
        if @current_user
            render json {logged_in: true, user: @currnet_user}
        else
            render json: {logged_in: false}
        end
    end

    def logout
        rese_session
        render json: {status: 200, logged_out: true}
    end
end
