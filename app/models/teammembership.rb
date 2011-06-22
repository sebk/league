class Teammembership < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  validates_presence_of :team, :user
  validates_uniqueness_of :user_id, :scope => :team_id

  after_create :set_admin

  def set_admin
    if self.team.teammemberships.count == 1
      self.admin = 1;
      self.save
    end
  end

end
