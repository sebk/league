class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :teammemberships
  
  has_many :teams, :through => :teammemberships

  #has_one :team, :through => :teammemberships, :conditions => "type = Singleplayerteam", :as => :singleplayerteam
  
  #belongs_to :singleplayerteam

  after_create :create_singleplayerteam

  validates_presence_of :name
  validates_length_of :name, :in => 3..15


  def create_singleplayerteam    
    self.teams.build(Singleplayerteam.create(:name => self.name))
    self.save
  end

end
