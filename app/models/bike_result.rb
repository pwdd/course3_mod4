class BikeResult < LegResult
  field :mph, type: Float

  def calc_ave
    if event && secs
      miles = event.miles
      self.mph = miles.nil? ? nil : (secs * 3600) / miles
    end
  end
end