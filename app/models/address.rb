class Address
  attr_accessor :city, :state, :location

  def initialize(city=nil, state=nil, location=nil)
    @city = city
    @state = state
    @location = location.nil? ? Point.new(0.0, 0.0) : location
  end

  def mongoize
    { city: city, state: state, loc: location.mongoize }
  end

  def self.mongoize(address)
    return nil if address.nil?
    if address.is_a?(Address)
      loc = address.location.mongoize
      { city: address.city, state: address.state, loc: loc }
    else
      address
    end
  end

  def self.demongoize(address)
    return nil if address.nil?
    address.is_a?(Address) ? address : Address.new(address[:city], address[:state], address[:loc])
  end

  def self.evolve(address)
    Address.mongoize(address)
  end
end