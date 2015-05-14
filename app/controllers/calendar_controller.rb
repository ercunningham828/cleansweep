class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @lastmonth=Date.civil(@year, @month)
    @nextmonth=Date.civil(@year, @month)
    

    
  end
  
end
