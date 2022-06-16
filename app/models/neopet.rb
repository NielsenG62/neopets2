class Neopet < ApplicationRecord
  include Feed
  belongs_to :user
  before_create do
    self.define_stats
    self.get_img
  end
  validates :pet_name, presence: true
  validates :pet_name, length: { in:3..20 }
  
  def define_stats
    self.att_stat = (rand(1..5) + rand(0..10))
    self.def_stat = (rand(1..5) + rand(0..10))
    self.spd_stat = (rand(1..5) + rand(0..10))
    self.hp_stat = (rand(2..5) + rand(4..10))
    self.current_hp_stat = self.hp_stat
  end

  def get_img
    self.pet_pic = "neopets/#{rand(1..11)}.png"
  end
end

