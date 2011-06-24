class Multiplayerteam < Team

  has_many :teammemberships
  has_many :users, :through => :teammemberships

end
