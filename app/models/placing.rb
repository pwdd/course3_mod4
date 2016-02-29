class Placing
  attr_accessor :name, :place

  def initialize(name, place)
    @name = name
    @place = place
  end

  def mongoize
    { name: name, place: place }
  end

  def self.mongoize(place)
    return nil if place.nil?
    place.is_a?(Placing) ? { name: place.name, place: place.place } : place
  end

  def self.demongoize(place)
    return nil if place.nil?
    Placing.new(place[:name], place[:place])
  end

  def self.evolve(place)
    Placing.mongoize(place)
  end
end