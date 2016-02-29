class Point
  attr_accessor :longitude, :latitude

  def initialize(longitude, latitude)
    @longitude = longitude
    @latitude = latitude
  end

  def mongoize
    { type: 'Point', coordinates: [longitude, latitude] }
  end

  def self.mongoize(point)
    return nil if point.nil?
    point.is_a?(Point) ? point.mongoize : point
  end

  def self.demongoize(point)
    return nil if point.nil?
    long, lat = point[:coordinates]
    Point.new(long, lat)
  end

  def self.evolve(point)
    Point.mongoize(point)
  end
end