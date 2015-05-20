class ScheduleController < ApplicationController
  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
   @schedule = Schedule.find(params[:id])

    if @schedule.update_attributes(schedule_params)
       flash[:notice] = "Schedule was updated."
       redirect_to root_path(tab:"schedule")
     else
       flash[:error] = "There was an error saving the schedule. Please try again."
       render :new
     end
  end

  private

  def schedule_params
     params.require(:schedule).permit(:monday_start,:monday_end,:tuesday_start,:tuesday_end,:wednesday_start,:wednesday_end,:thursday_start,:thursday_end,:friday_start,:friday_end,:saturday_start,:saturday_end,:sunday_start,:sunday_end)
  end
end
