class Plan < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  has_many :plan_locationships
  has_many :locations, :through => :plan_locationships

  def to_api
    if self.locations.size > 0
      start = [self.start_lat, self.start_lng]
      ed = [self.end_lat, self.end_lng]
      locations = self.locations.map { |l| [l.lat, l.lng, l.ch_name] }
      waypoints = locations.map { |l| "#{l[0]},#{l[1]}"}.join("|")
      uri = URI("https://maps.googleapis.com/maps/api/directions/json?origin=#{start.first},#{start.last}&destination=#{ed.first},#{ed.last}&waypoints=optimize:true|#{waypoints}&key=#{ENV['GOOGLE_MAP_API_KEY']}")
      j = JSON.parse(Net::HTTP.get(uri))
      order = j["routes"][0]["waypoint_order"]
      res = ["臺北車站"]
      order.each do |index|
        res << locations[index].last
      end
      res << "臺北車站"
      return res
    end
  end
end
