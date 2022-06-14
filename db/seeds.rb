
Neopet.destroy_all

2.times do |index|
  Neopet.create!( pet_name: Faker::Games::Witcher.monster, user_id: 1)
end


p "Created #{Neopet.count} pets"