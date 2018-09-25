namespace :dev do
  # post假資料產生
  task fake_post: :environment do
    Post.destroy_all
      30.times do |i|
        Post.create!(
          title: FFaker::Book.title,
          description: FFaker::Book.description,
          viewed_count: FFaker::Random.rand(10..50),
          created_at: FFaker::Time.datetime
        )
      end
      puts "have created #{Post.count} fake posts"
  end
end