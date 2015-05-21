class UsersController < ApplicationController
  def new
  end

  def create
        
  end

  def show
     @user=User.find(current_user)
     @properties=@user.properties
     @schedule=@user.schedule 
     @confirmed_bookings=@user.bookings.confirmed
     @pending_bookings=@user.bookings.pending
     @canceled_bookings=@user.bookings.canceled_or_rejected
     @completed_bookings=@user.bookings.completed
  end
end
