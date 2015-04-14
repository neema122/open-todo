class Api::UsersController < ApplicationController

   before_action :authenticated?
 
   def index
    @users = User.all 
    render json: @users, each_serializer: IndexUserSerializer
  end

 end