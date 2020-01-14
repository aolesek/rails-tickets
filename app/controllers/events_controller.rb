class EventsController < ApplicationController
  before_action :check_logged_in, :only => [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:artist, :price_low, :price_high, :event_date, :description)
  end

  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
    username == "admin" && password == "password" end
    end
end
