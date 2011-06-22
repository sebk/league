class Team < ActiveRecord::Base
  has_many :teammemberships
  has_many :users, :through => :teammemberships
  has_many :participations

  validates_presence_of :name
end
