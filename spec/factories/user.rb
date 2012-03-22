Factory.define :user do |u|
  u.first_name { Faker::Name.first_name }
  u.last_name { Faker::Name.last_name }
  u.sequence(:email) { |n| "person#{n}@example.com" }
  u.password { "#{rand}-#{rand}-aTads" }
  u.password_confirmation { |u| u.password }
end

Factory.define :admin_user do |u|
  u.sequence(:email) { |n| "admin#{n}@example.com" }
  u.password { "#{rand}-#{rand}-aTads" }
  u.password_confirmation { |u| u.password }
end

