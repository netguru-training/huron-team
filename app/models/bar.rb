class Bar < ActiveRecord::Base
  has_and_belongs_to_many :beers
  accepts_nested_attributes_for :beers
  belongs_to :user
  scope :working_bars, -> { Bar.select('bars.*').joins(:beers).group('bars.id').having("count(beer_id)>0")}
  validates :name, presence: true
end

