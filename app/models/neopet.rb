class Neopet < ApplicationRecord
  require 'rufus-scheduler'
  include Feed
  include Battle
  belongs_to :user
  before_create do
    self.define_stats
    self.get_img
    @scheduler = Rufus::Scheduler.new
  end
  # after_create do
  #   @job =
  #   @scheduler.every '10s' do 
  #     new_health = self.current_hp_stat -= 1
  #     self.update(current_hp_stat: new_health)
  #     self.shutdown
  #   end
  # end
  validates :pet_name, presence: true
  validates :pet_name, length: { in:3..20 }
  
  def define_stats
    self.att_stat = (rand(1..5) + rand(0..10))
    self.def_stat = (rand(1..5) + rand(0..10))
    self.spd_stat = (rand(1..5) + rand(0..10))
    self.hp_stat = (rand(1..5) + rand(0..10))
    self.current_hp_stat = self.hp_stat
  end

  def get_img
    self.pet_pic = "neopets/#{rand(1..11)}.png"
  end

  def shutdown
    @scheduler.unschedule(@job) if self.current_hp_stat <= 0
  end
end

