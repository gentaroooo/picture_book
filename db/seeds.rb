10.times do
  User.create(
      name: Faker::Name.name,
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '12345678',
      password_confirmation: '12345678'
  )
end

20.times do |index|
  Board.create(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index}",
      body: "本文#{index}"
  )
end