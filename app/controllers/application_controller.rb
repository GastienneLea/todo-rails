class ApplicationController < ActionController::API
    include Graphiti::Rails::Responders
    
    attr_accessor :current_user

    def authenticate_user
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])

            rescue ActiveRecord::RecordNotFound => e
                render json: { errors: 'Unauthorized' }, status: :unauthorized
            rescue JWT::DecodeError => e
                render json: { errors: 'Unauthorized' }, status: :unauthorized
        end
    end
end
