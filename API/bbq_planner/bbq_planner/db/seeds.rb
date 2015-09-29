Barbecue.destroy_all
User.destroy_all

# Seed Barbecues

barbecues = []
10.times do
  title = [ "#{Faker::Team.name} victory BBQ", "#{Faker::Name.name} Birthday BBQ" ].sample
  venue = [ Faker::Address.city, Faker::Company.name ].sample

  b = Barbecue.create(date: Faker::Date.forward(23), title: title, venue: venue)
  barbecues << b
end

users = []
10.times do
  name = ["#{Faker::Name.name}"].sample
  email = [Faker::Internet.email].sample
  password = "123456789"
  u = User.create(name: name, email: email, password: password, password_confirmation: password)
  users << u
end
  
puts "Done"
