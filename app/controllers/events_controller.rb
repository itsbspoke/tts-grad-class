class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  before_action :load_group
  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    @rsvp = Rsvp.new(user: current_user)
    @rsvp.event = @event
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
    
    def load_group
      if params[:group_id]
        @group = Group.find(params[:group_id])
      end
    end

    def event_params
      params.require(:event).permit(:group_id, :starts_at, :ends_at, :title, :description)
    end
end
