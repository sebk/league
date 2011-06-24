class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :teammemberships
  has_many :teams, :through => :teammemberships

  after_create :create_team

  validates_presence_of :name
  validates_length_of :name, :in => 3..15


  def create_team
    self.teams.create(:name => self.name)
  end

end
