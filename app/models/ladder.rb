class Ladder < ActiveRecord::Base
  has_many :games, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_many :teams, :through => :participations

  validates_presence_of :name

  def calculate_ranks
    self.participations.each.with_index do |p,i|
      p.update_attribute(:rank, i+1)
    end
  end
end
