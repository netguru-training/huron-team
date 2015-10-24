class Bar < ActiveRecord::Base
  has_and_belongs_to_many :beers
  accepts_nested_attributes_for :beers
  validates :name, presence: true
end

