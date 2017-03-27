luneth = User.create!(email: "luneth@example.com",
                      password: "asdasd",
                      password_confirmation: "asdasd",
                      first_name: "luneth",
                      last_name: "l",
                      phone: "9499231222")

ramiel = User.create!(email: "ramiel@example.com",
                      password: "asdasd",
                      password_confirmation: "asdasd",
                      first_name: "ramiel",
                      last_name: "r",
                      phone: "9499231222")

artemios = User.create!(email: "artemios@example.com",
                        password: "asdasd",
                        password_confirmation: "asdasd",
                        first_name: "artemios",
                        last_name: "art",
                        phone: "9499231222")

users = [luneth, ramiel, artemios]

puts "3 users created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rat content", user_id: users[post % 3].id, overtime_request: 2.5)
end

puts "100 posts have been created"

100.times do |audit_log|
  AuditLog.create(user_id: users.first.id, status: 0, start_date: (Date.today - 1.day))
  users.shuffle!
end

puts "100 audit logs created"

AdminUser.create(email: "gerald@example.com",
                  password: "123123",
                  password_confirmation: "123123",
                  first_name: "gerald",
                  last_name: "hernandez",
                  phone: "9499231222")

puts "1 admin user created"
