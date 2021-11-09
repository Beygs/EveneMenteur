class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def create

    event = params[:event]
    datetime = DateTime.new(
      event['start_date(1i)'].to_i,
      event['start_date(2i)'].to_i,
      event['start_date(3i)'].to_i,
      event['start_date(4i)'].to_i,
      event['start_date(5i)'].to_i,
      event['start_date(6i)'].to_i,
    )

    # datetime = DateTime.new(
    #   params[:start_date(1i)],
    #   params[:start_date(2i)],
    #   params[:start_date(3i)],
    #   params[:start_date(4i)],
    #   params[:start_date(5i)],
    #   params[:start_date(6i)],
    # )

    @new_event = Event.new(
      title: event[:title],
      description: event[:description],
      price: event[:price].to_i,
      start_date: datetime,
      duration: event[:duration].to_i,
      location: event[:location],
      admin: current_user
    )
    if @new_event.save
      redirect_to root_path
    else
      @new_event.errors.full_messages.each { |e| puts e }
      redirect_to new_event_path
    end
  end
end
