class BookingStepsController < ApplicationController
  include Wicked::Wizard
  steps :select_vendor,:confirm_booking
  
  def show
    if step !="wicked_finish"
    @booking = Booking.find(params[:booking])
    @property=@booking.property
    if params[:sort]=="rate"
      @vendors=Vendor.near(@property.coordinates).sort {|a,b| a.rate(@property) <=> b.rate(@property)}
    else
      @vendors=Vendor.near(@property.coordinates).order(sort_column + " " + sort_direction)
    end
  
    if params[:vendor].present?
      @vendor=Vendor.find(params[:vendor])
      @booking.vendor=@vendor
      @booking.save
    end
  end

    render_wizard
  end
  
  def update
    @booking = Booking.find(params[:booking][:id])
    @booking.update(booking_params)

    render_wizard @booking
  end

  def finish_wizard_path
    root_path(tab:"bookings")
  end

private

  def booking_params
    params.require(:booking).permit(:vendor,:customer,:property_id,:date,:time,:status,:cost)
  end
end
