Factory.define :showroom do |s|
  s.sequence(:title) { |n| "Showroom-#{n}" }
end
