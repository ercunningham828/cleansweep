class UsersController < ApplicationController
  def new
  end

  def create
        
  end
  def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path(current_user)
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path(current_user)
     end
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

  private
 
   def user_params
     params.require(:user).permit(:name,:email,:phone_number,:role,:base_rate,:bedroom_rate,:bathroom_rate,:zipcode,:password,:password_confirmation)
   end
end
