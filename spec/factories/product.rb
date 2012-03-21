Factory.define :product do |p|
  p.name { Faker::Name.name }
  p.description "test product"
  p.price 1_000
  p.image { File.new(Rails.root.join("spec", "support", "files", "chromium_logos.jpg")) }
end
