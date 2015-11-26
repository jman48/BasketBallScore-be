class Game < ActiveRecord::Base
  has_many :players, :dependent => :destroy
  
  after_initialize :init

  def init
    self.is_active ||= 0
  end
end
