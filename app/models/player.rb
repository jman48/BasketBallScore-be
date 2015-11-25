class Player < ActiveRecord::Base

  belongs_to :game
  belongs_to :user

  after_initialize :init

  def init
    self.score ||= 0
  end

end
