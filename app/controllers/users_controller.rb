class UsersController < ApplicationController

def index
  @users = User.new
end

def show
  @user = User.find(2)
end

def login
  if User.exists?(:email => params[:email], :password => params[:password])
    redirect_to users_path, :notice => "Post successfully created"
  else
  	redirect_to projects_path(@user)
  end
end

end