class ConnectionsController < ApplicationController
	def index
		@users = User.where.not(id: User.find(current_user).connections).where.not(id: User.find(current_user).contacts).where.not(id: User.find(current_user).connected_to).where.not(id: User.find(current_user))
	end

	def create
		contact = User.find(params[:id])
		Connection.create(user: User.find(current_user), contact: contact)
		return redirect_to :back
	end

	def update
		@contact = User.find(params[:id])
		Connection.find_by(user: @contact, contact: User.find(current_user)).update(accept: true)
		Connection.create(user: User.find(current_user), contact: @contact, accept: true)
		return redirect_to :back
	end

	def destroy
		Connection.find_by(user: User.find(params[:id]), contact: User.find(current_user)).delete
		redirect_to :back
	end
end
