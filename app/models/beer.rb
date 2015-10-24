class Beer < ActiveRecord::Base
  validates :name, :kind, presence: true
end
