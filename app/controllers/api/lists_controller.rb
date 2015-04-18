class Api::ListsController < ApplicationController
   before_action :authenticated?
 
   def create
    @user = User.where(user_params).first
    if @user
      @list = @user.lists.find(params[:list_id])
      if @list.add(item_params[:description])
        render json: @list.items.last
      else
        error(422, "Item was not created")
      end
    else
      error(422, "User credentials are not correct")
    end
  end

    if @list.save
      redirect_to user_list_path(@user, @list), notice: 'List was successfully created.'
    else
      render action: 'new'
    end
   end
  
  def update
   list = List.find(params[:id])
   if list.update(list_params)
     render json: list.to_json
   else
     render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
   end
 end
  
#   def update
#     @user = User.where(user_params).first
#     if @user
#       @list = List.find(params[:id])
#       if @list.permission_options.
#         @list.update_attributes(list_params)
#         render json: @list
#       elsif @list.list_open?
#         @list.update_attributes(name: params[:list][:name])
#         render json: @list
#       else
#         error(401, "You do not have permissions")
#       end
#     else
#       message = "User credentials are not correct"
#       error(422, message)
#     end
#   end
 
 end