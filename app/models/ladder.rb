class Ladder < ActiveRecord::Base
  has_many :games, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_many :teams, :through => :participations

  validates_presence_of :name
end
