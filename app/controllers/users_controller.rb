class UsersController < ApplicationController

  def index
    @users = User.new
  end

  def show
    @user = User.find(2)
  end

  before_save :create_remember_token

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end