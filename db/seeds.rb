require 'random_data'
me = User.create(email: "jsanders.sarah@gmail.com", password: "testtest")
#Create Posts
50.times do
  Wiki.create!(
    user: me,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    private: true
  )
end
wikis = Wiki.all

#Create Comments
100.times do
  Comment.create!(
    wiki: wikis.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{Comment.count} comments created"
