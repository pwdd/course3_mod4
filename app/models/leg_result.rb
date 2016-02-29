class LegResult
  include Mongoid::Document
  field :secs, type: Float

  def calc_ave
  end

  after_initialize do |doc|
    calc_ave
  end

  def secs=(secs)
    self[:secs] = secs
    calc_ave
  end
end
