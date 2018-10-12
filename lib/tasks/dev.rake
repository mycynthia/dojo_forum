namespace :dev do
  # post假資料產生
  task fake_post: :environment do
    Post.destroy_all
      30.times do |i|
        Post.create!(
          title: FFaker::Book.title,
          description: FFaker::Book.description,
          viewed_count: FFaker::Random.rand(10..50),
          image: File.open(File.join(Rails.root, "public/seed_image/#{rand(1...11)}.jpg")),
          user: User.all.sample,
          category_ids: (1...6).to_a.shuffle.take(rand(2..4))
        )
      end
      puts "have created #{Post.count} fake posts"
  end

  task fake_comment: :environment do
    Comment.destroy_all
      Post.all.each do |post|
        30.times do |i|
          post.comments.create!(
            content: FFaker::Lorem.sentence,
            user: User.all.sample
          )
      end
    end
    puts "Crested #{Comment.count} fake comments"
  end

# create user
  task fake_user: :environment do
    User.destroy_all

    User.create!(
      name: "admin",
      email: "admin@example.com",
      password: "12345678",
      role: "admin",
      avatar: FFaker::Avatar.image
    )
    puts "Admin created!"

    20.times do |i|
      name = FFaker::Name::first_name
      file = File.open("#{Rails.root}/public/avatar/#{i+1}.png")
      user = User.new(
        name: name,
        email: "#{name}@example.com",
        password: "12345678",
        role: "normal",
        introduction: FFaker::Lorem::sentence(30),
        avatar: file
        )
    user.save!
    puts user.name
    end
  end

end