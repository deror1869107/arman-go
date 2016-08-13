class Plan < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  has_many :plan_locationships
  has_many :locations, :through => :plan_locationships

  def to_api
    locations = self.locations
    res = {}
    res[:start] = [self.start_lat, self.start_lng]
    res[:end] = [self.end_lat, self.end_lng]
    res[:travel] = locations.map { |l| [l.lat, l.lng] }
    return res
  end
end
