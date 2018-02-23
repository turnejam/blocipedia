require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(8)
  )
end
users = User.all

50.times do
  Wiki.create!(
    title: Faker::Beer.unique.name,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    private: false,
    user: users.sample
  )
end
