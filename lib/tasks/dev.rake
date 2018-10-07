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
          created_at: FFaker::Time.datetime,
          user_id: FFaker::Random.rand(1..22),
          category_ids: (26...31).to_a.shuffle.take(rand(2..4))
        )
      end
      puts "have created #{Post.count} fake posts"
  end

end

# uiname
namespace :dev do
  task fetch_user: :environment do
    User.destroy_all
    url = "https://uinames.com/api/?ext&region=england"
    20.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      user = User.create!(
        name: data["name"],
        email: data["email"],
        password: data["password"],
        avatar: data["photo"] 
      )

      puts "created user #{user.name}"
    end

    puts "now you have #{User.count} users data"
  end

end