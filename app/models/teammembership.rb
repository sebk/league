class Teammembership < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  validates_presence_of :team, :user
end
