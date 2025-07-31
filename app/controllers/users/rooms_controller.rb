class Users::RoomsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @owned_rooms = @user.rooms
  end
end