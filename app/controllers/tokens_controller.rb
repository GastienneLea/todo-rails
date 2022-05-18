class TokensController < ApplicationController
    def create
        @user = User.find_by_username(params[:username])

        if @user
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), id: @user.id,
                username: @user.username }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end

    end

    def login_params
        params.permit(:username)
    end
end
