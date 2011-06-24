class Ladder < ActiveRecord::Base
  has_many :games, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_many :teams, :through => :participations

  validates_presence_of :name

  def calculate_rank
    self.particicaptions.each.with_index do |p,i|
      p.update_attribue(rank, i+1)
    end
  end
end
