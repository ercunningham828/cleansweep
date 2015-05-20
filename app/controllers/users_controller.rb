class UsersController < ApplicationController
  def new
  end

  def create
        
  end

  def show
     @user=User.find(current_user)
     @properties=@user.properties
     @schedule=@user.schedule
  end
end
