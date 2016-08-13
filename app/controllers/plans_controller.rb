class PlansController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_plan, :only => []

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    @historicals = Location.all.select { |l| l.location_type == 1 }
    @temples = Location.all.select { |l| l.location_type == 2 }
    @museums = Location.all.select { |l| l.location_type == 3 }
  end

  def create
    @plan = Plan.create(plan_params)
    @plan.location_ids = params[:plan][:location_ids]
    @plan.start_lat = @plan.end_lat = "25.0477498"
    @plan.start_lng = @plan.start_lng = "121.5170497"
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def plan_params
    params.permit(:name, :travel_time, :location_ids)
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
