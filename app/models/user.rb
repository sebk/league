class User < ActiveRecord::Base
  has_many :teammemberships
  has_many :teams, :through => :teammemberships
  validates_presence_of :name
  validates_length_of :name, :in => 3..15
end
