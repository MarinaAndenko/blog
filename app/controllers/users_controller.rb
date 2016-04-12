class UsersController < ApplicationController

	before_action :set_user

	def show
  end

  def edit
  end

  def update
    if params['remove_avatar']=='true'
      @user.remove_avatar!
      @user.remove_avatar = true
    end 
  	if @user.update(user_params)
			redirect_to @user
	  else
			render 'edit' 
	  end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
		def user_params
		  params.fetch(:user, {}).permit(:avatar)
		end 
end
