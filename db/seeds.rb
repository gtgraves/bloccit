require 'random_data'
#Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
unique = Post.find_or_create_by!(title: "This is My Unique Post", body: "This is the body of my unique post.")
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
Comment.find_or_create_by!(body: "This is my unique comment to my unique post.", post: unique)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
