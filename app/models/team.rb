class Team < ActiveRecord::Base
  has_many :participations, :dependent => :destroy
  has_many :teammemberships
  has_many :users, :through => :teammemberships
  has_many :ladders, :through => :participations


  validates_presence_of :name

  def joins(ladder)
    p = self.participations.build(:ladder_id => ladder.id)
    p.save
  end

  def leaves(ladder)
    p = self.participations.where(:ladder_id => ladder.id).first
    p.destroy
  end

  scope :without_user, proc{ |user| { :conditions => ['id not in (?)', user.team_ids]  }}

  scope :singleplayer, where(:singleplayer => true)

  scope :multiplayer, where(:singleplayer => false)


  def as_json(options={})
    super(:include => [:users, :ladders], 
          :only => [:name, :singleplayer, :id, :admin, :email])
  end


  alias_method :ar_to_xml, :to_xml
  def to_xml(options = {})
    options[:include] = [:users, :ladders]
    options[:only] = [:name, :singleplayer, :id, :admin, :email]
    ar_to_xml(options)
  end

end
