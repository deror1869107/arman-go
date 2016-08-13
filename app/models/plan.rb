class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :plan_locationships
  has_many :locations, :through => :plan_locationships
end
