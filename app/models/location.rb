class Location < ActiveRecord::Base
  has_many :plan_locationships
  has_many :plans, :through => :plan_locationships
end
