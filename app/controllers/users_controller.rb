class UsersController < ApplicationController

  def index
    @users = User.new
  end

  def show
    @user = User.all
  end

end