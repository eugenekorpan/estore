Factory.define :showroom do |s|
  s.title { Faker::Company.name }
  s.association :user, :factory => :user
end
