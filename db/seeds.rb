100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rat content")
end

puts "100 posts have been created"
