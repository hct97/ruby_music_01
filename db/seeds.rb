Singer.create! name: "Rhymastic",
               description: Faker::Lorem.sentence(5)

Singer.create! name: "JSOL",
               description: Faker::Lorem.sentence(5)

Singer.create! name: "JustaTee",
               description: Faker::Lorem.sentence(5)

Singer.create! name: "Magazine",
              description: Faker::Lorem.sentence(5)

Singer.create! name: "The Men",
               description: Faker::Lorem.sentence(5)

Singer.create! name: "Andiez",
              description: Faker::Lorem.sentence(5)

User.create! name: "ADMIN",
             password: "123456",
             email: "huynhchitrung97@gmail.com",
             role: 1

3.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Singer.create! name: name,
                 description: description
end

Singer.create! name: "Other",
               description: Faker::Lorem.sentence(5)

Song.create! singer_id: 1,
              title: "Yeu 4",
              lyrics: Faker::Lorem.sentence(200),
              song_url: "https://res.cloudinary.com/trunghc/video/upload/v1542677337/Yeu_4_-_Rhymastic.mp3",
              view: 8758

Song.create! singer_id: 2,
            title: "Lang",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543721999/Lang-JSOL.mp3",
            view: rand(1..2000)

Song.create! singer_id: 3,
            title: "Hoa Sua",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543721980/Hoa_Sua_-_JustaTee_Mr_A.mp3",
            view: rand(1..2000)

Song.create! singer_id: 4,
            title: "24h",
            lyrics: Faker::Lorem.sentence(1000),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1544082810/24h-LyLy-Magazine.mp3",
            view: rand(1..2000)

Song.create! singer_id: 4,
            title: "Duong 1 chieu",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1544318445/DuongMotChieu-HuynhTu-4615451.mp3",
            view: rand(1..2000)

Song.create! singer_id: 5,
            title: "Tan bao giac mo",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543722031/TanBaoGiacMo-TheMen-2435164.mp3",
            view: rand(1..2000)

Song.create! singer_id: 6,
            title: "1 Phut",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543720987/1-Phut-Andiez.mp3",
            view: rand(1..2000)

Song.create! singer_id: 1,
            title: "Nguoi va ta",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1544318584/Nguoi-Va-Ta-Rhymastic-Thanh-Huyen.mp3",
            view: rand(1..2000)

Song.create! singer_id: 3,
            title: "Imma Heartbreaker",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543721993/Imma_Heartbreaker_-_JustaTee_Emily_LK.mp3",
            view: rand(1..2000)

Song.create! singer_id: 3,
            title: "Mat troi cua em",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543721988/Mat-Troi-Cua-Em-Phuong-Ly-JustaTee.mp3",
            view: rand(1..2000)

Song.create! singer_id: 10,
            title: "Khong the thay the",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543720995/Khong-The-Thay-The-365DaBand.mp3",
            view: rand(1..2000)

Song.create! singer_id: 10,
            title: "Cau vong tinh yeu",
            lyrics: Faker::Lorem.sentence(200),
            song_url: "https://res.cloudinary.com/trunghc/video/upload/v1543721931/Cau_Vong_Tinh_Yeu_-_Ustylez.mp3",
            view: rand(1..2000)


Genre.create! title: "Pop"
Genre.create! title: "Ballad"
Genre.create! title: "Rock"
Genre.create! title: "R&B"
Genre.create! title: "New"
Genre.create! title: "Acoutic"
Genre.create! title: "EDM"
Genre.create! title: "LoveSong"

GenreSong.create! genre_id: 1,
                  song_id: 1
GenreSong.create! genre_id: 1,
                  song_id: 2
GenreSong.create! genre_id: 1,
                  song_id: 3
GenreSong.create! genre_id: 2,
                  song_id: 1
GenreSong.create! genre_id: 2,
                  song_id: 2
GenreSong.create! genre_id: 3,
                  song_id: 2
GenreSong.create! genre_id: 4,
                  song_id: 3
GenreSong.create! genre_id: 5,
                  song_id: 6
GenreSong.create! genre_id: 5,
                  song_id: 2
GenreSong.create! genre_id: 7,
                  song_id: 2
GenreSong.create! genre_id: 8,
                  song_id: 2

10.times do |n|
  singer_id = rand(1..10)
  title = Faker::Name.name
  lyrics = Faker::Lorem.sentence(100)
  song_url = "https://res.cloudinary.com/trunghc/video/upload/v1542677337/#{n+1}.mp3"
  view = rand(1..500)
  Song.create! singer_id: singer_id,
               title: title,
               lyrics: lyrics,
               song_url: song_url,
               view: view
end

20.times do
  GenreSong.create! genre_id: rand(1..5),
                    song_id: rand(5..15)
end

10.times do |n|
  name = Faker::Name.last_name
  password = "123456"
  email = "user#{n+1}@gmail.com"
  User.create! name: name,
               password: password,
               email: email
end

users = User.order(:created_at).take(11)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    user.comments.create! content: content,
                          song_id: rand(1..10)
  end
end

3.times do
  name = Faker::Name.name
  users.each do |user|
    user.playlists.create! name: name
  end
end
