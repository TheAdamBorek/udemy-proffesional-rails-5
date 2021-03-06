# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."

3.times do |index|
  Topic.create!(
      name: "Topic #{index}"
  )
end

9.times do |i|
  Post.create!(
      {
          title: "Post #{i}",
          body: lorem,
          topic_id: Topic.all[rand 3]
      }
  )
end

8.times do |i|
  Portfolio.create!(
      title: "Portfolio title: #{i}",
      subtitle: "Ruby on Rails",
      body: lorem,
      main_image: 'https://fakeimg.pl/600x300/',
      thumb_image: 'https://fakeimg.pl/250x100/'
  )
end

1.times do |i|
  Portfolio.create!(
      title: "Portfolio title: #{i}",
      subtitle: "Swift",
      body: lorem,
      main_image: 'https://fakeimg.pl/600x300/',
      thumb_image: 'https://fakeimg.pl/250x100/'
  )

  last_portfolio = Portfolio.last
  3.times do |i|
    last_portfolio.technologies.create!(name: "Technology #{i}")
  end
end