class Api::UsersController < ApplicationController

   before_action :authenticated?
 
   def index
    @users = User.all 
    render json: @users, each_serializer: IndexUserSerializer
  end
  
   def create
     user = User.new(user_params)
     if user.save
       render json: user.to_json
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
   end

   private
   def user_params
     params.require(:user).permit(:username, :password)
   end

 end