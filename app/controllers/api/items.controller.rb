class Api::ItemsController < ApplicationController
   before_action :authenticated?
 
   def create
     if @list.add(item_params[:description])
      redirect_to user_list_path(@list.user, @list), notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
   end
  
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item.to_json
   else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
   end
 end

 end