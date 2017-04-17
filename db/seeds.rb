require 'random_data'

50.times do
  
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by!(
  title: "Something unique",
  body: "Another unique thing"
  )

post = Post.find_by!(title: "Something unique")
post.comments.create(body: "Unique comment body")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"