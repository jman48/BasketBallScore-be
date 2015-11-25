class User < ActiveRecord::Base
  has_many :player
  after_initialize :init

  def init
    self.totalHoops ||= 0
    self.highestStreak ||= 0
    self.shootoutsWon ||= 0
  end

end
