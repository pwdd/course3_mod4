class Event
  include Mongoid::Document
  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String

  def meters
    return nil if self.units.nil? || self.distance.nil?
    case self.units
    when 'miles' then self.distance * 1609.34
    when 'kilometers' then self.distance * 1000
    when 'yards' then self.distance * 0.9144
    when 'meters' then self.distance
    else nil
    end
  end

  def miles
    return nil if self.units.nil? || self.distance.nil?
    case self.units
    when 'meters' then self.distance * 0.000621371
    when 'kilometers' then self.distance * 0.621371
    when 'yards' then self.distance * 0.000568182
    when 'miles' then self.distance
    else nil
    end
  end
end
