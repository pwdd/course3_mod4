class LegResult
  include Mongoid::Document
  field :secs, type: Float

  embedded_in :entrant
  embeds_one :event, as: :parent

  validates :event, presence: true

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
