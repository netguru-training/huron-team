class Bar < ActiveRecord::Base
  has_and_belongs_to_many :beers
  accepts_nested_attributes_for :beers

  scope :working_bars, -> { Bar.select { |bar| bar.beers.count > 0 }}
  validates :name, presence: true
end

