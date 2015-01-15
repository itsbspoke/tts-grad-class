# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'forgery'

you = User.find_by(email: "test@example.com") || User.create(email: "test@example.com", password: "12345678")
jim = User.find_by(email: "jim@itsbspoke.com") || User.create(email: "jim@itsbspoke.com", password: "12345678")

# Create 5 Jim groups 

5.times do |i|
  g = Group.create(name: Forgery(:name).company_name, owner: jim)
  puts "Created #{g.name}"
  10.times do |e|
    starts_at = (rand(14)-7).days.from_now
    ends_at = 1.5.hours.from_now(starts_at)
    ev = Event.create(title: Forgery(:name).full_name, 
                        user: jim, group: g,
                        description: Forgery(:lorem_ipsum).paragraphs,
                        starts_at: starts_at,
                        ends_at: ends_at
                        )
    puts "Created event #{ev.title}"
  end
  if rand(2) == 0
    you.groups << g 
    puts "Added you to #{g.name}"
  end
end


# 
