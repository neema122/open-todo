class Api::ItemsController < ApplicationController
   before_action :authenticated?
 
   def create
     if @list.add(item_params[:description])
      redirect_to user_list_path(@list.user, @list), notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
   end

 end