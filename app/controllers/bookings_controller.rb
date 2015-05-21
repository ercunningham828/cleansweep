class BookingsController < ApplicationController
  def new
    @booking=Booking.new
    @properties=current_user.properties
  end

  def create
  @booking=current_user.bookings.build(booking_params)
  @property=User.find(params[:booking][:property_id])

    if @booking.save
       redirect_to booking_steps_path(:booking=>@booking)
     else
       flash[:error] = "There was an error creating the booking. Please try again."
       render :new
     end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
    @booking=Booking.find(params[:id])
    @booking.status="confirmed"
    @booking.save
    redirect_to root_path(tab:"bookings")
  end

   def reject
    @booking=Booking.find(params[:id])
    @booking.status="rejected by vendor"
    @booking.save
    redirect_to root_path(tab:"bookings")
  end

   def cancel
    @booking=Booking.find(params[:id])
    @user=current_user
    @booking.status="canceled by #{@user.role}"
    @booking.save
    redirect_to root_path(tab:"bookings")
  end


  private

  def booking_params
    params.require(:booking).permit(:vendor,:customer,:property_id,:date,:time,:status,:cost)
  end
end
