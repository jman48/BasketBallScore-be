class Player < ActiveRecord::Base

  belongs_to :users
  belongs_to :games

  after_initialize :init

  def init
    self.score ||= 0
  end

end
