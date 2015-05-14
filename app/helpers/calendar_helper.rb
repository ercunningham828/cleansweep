module CalendarHelper
  def month_link(month_date)
    link_to(month_date, :format => "%B")
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :previous_month_text => "<< " + month_link(@lastmonth),
      :next_month_text => month_link(@nextmonth) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/events/#{event.id}" title="#{h(event.name)}">#{h(event.name)}</a>)
    end
  end
end
