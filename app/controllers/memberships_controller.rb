class MembershipsController < ApplicationController
  
  include Payola::StatusBehavior
  
  before_action :authenticate_user!, except: [:index, :show]
    
  before_action :set_group
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @memberships = Membership.all
    respond_with(@memberships)
  end

  def show
    respond_with(@membership)
  end

  def new
    @membership = Membership.new
    respond_with(@membership)
  end

  def edit
  end

  def create
    # do any required setup here, including finding or creating the owner object
    member = current_user # this is just an example for Devise

    # set your plan in the params hash
    params[:plan] = @group.default_plan
    params[:amount] = params[:plan].amount

    # call Payola::CreateSubscription
    subscription = Payola::CreateSubscription.call(params, member)
    Membership.create(user: member, group: @group)

    # Render the status json that Payola's javascript expects
    render_payola_status(subscription)
  end

  def update
    @membership.update(membership_params)
    respond_with(@membership)
  end

  def destroy
    @membership.destroy
    respond_with(@membership)
  end

  private
    def set_group
      @group = Group.friendly.find(params[:group_id])
    end

    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:user_id, :group_id)
    end
end
