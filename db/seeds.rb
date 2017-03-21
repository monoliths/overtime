luneth = User.create!(email: "luneth@example.com", password: "asdasd", password_confirmation: "asdasd", first_name: "luneth", last_name: "l")
ramiel = User.create!(email: "ramiel@example.com", password: "asdasd", password_confirmation: "asdasd", first_name: "ramiel", last_name: "r")
artemios = User.create!(email: "artemios@example.com", password: "asdasd", password_confirmation: "asdasd", first_name: "artemios", last_name: "art")
users = [luneth, ramiel, artemios]

puts '3 users created'

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rat content", user_id: users[post % 3].id)
end

puts "100 posts have been created"

AdminUser.create(email: "gerald@example.com", password: "123123", password_confirmation: "123123", first_name: "gerald", last_name: "hernandez")
