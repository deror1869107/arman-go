class PlansController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_plan, :only => [ :show ]

  def index
    @plans = current_user.plans
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    @plan.user_id = current_user.id
    @plan.location_ids = params[:plan][:location_ids]
    @plan.start_lat = @plan.end_lat = "25.0477498"
    @plan.start_lng = @plan.end_lng = "121.5170497" #Taipei Main Station
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :travel_time, :location_ids)
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
