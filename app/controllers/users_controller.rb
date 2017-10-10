class UsersController < ApplicationController
	def index
		@invites=Connection.where(contact: User.find(current_user)).where(accept: false)
      	@connected=Connection.where(user: User.find(session[:user_id])).where(accept: true)
	end

	def create
		user = User.new(user_params)

		if user.save
			session[:user_id] = user.id
			return redirect_to users_path
		else
			flash[:errors] = user.errors.full_messages
			return redirect_to :back
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation, :description)
		end
end
