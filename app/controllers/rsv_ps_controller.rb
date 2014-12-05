class RsvPsController < ApplicationController
  before_action :set_event
  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]  

  respond_to :html

  def index
    @rsvps = Rsvp.all
    respond_with(@rsvps)
  end

  def show
    respond_with(@rsvp)
  end

  def new
    @rsvp = Rsvp.new
    respond_with(@rsvp)
  end

  def edit
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    @rsvp.event = @event
    @rsvp.user = current_user
    @rsvp.save
    redirect_to @event
  end

  def update
    @rsvp.update(rsvp_params)
    respond_with(@rsvp)
  end

  def destroy
    @rsvp.destroy
    respond_with(@rsvp)
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end  
  
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    def rsvp_params
      params.require(:rsvp).permit(:user_id, :event_id, :guest_count)
    end
end
