class Api::ListsController < ApplicationController
   before_action :authenticated?
 
   def create
      @list = List.new(list_params)
    @list.user_id = @user.id

    if @list.save
      redirect_to user_list_path(@user, @list), notice: 'List was successfully created.'
    else
      render action: 'new'
    end
   end
 
 end