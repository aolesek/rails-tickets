class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:artist, :price_low, :price_high, :date, :description)
  end
end
