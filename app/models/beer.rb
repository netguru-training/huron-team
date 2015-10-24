class Beer < ActiveRecord::Base
  has_and_belongs_to_many :bars
  
  validates :name, :kind, presence: true
end
