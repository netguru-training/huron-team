class Beer < ActiveRecord::Base
  has_and_belongs_to_many :bars
  ratyrate_rateable "taste"

  validates :name, :kind, presence: true
end
