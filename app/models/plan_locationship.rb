class PlanLocationship < ActiveRecord::Base
  belongs_to :plan
  belongs_to :location
end
