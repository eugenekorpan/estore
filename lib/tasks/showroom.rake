# should be executed once a month by a cron job
# 0 0 1 * * 'rake showrooms:update'

namespace :showrooms do
  desc "creates new showroom for every user and populates it with new products"
  task :update => :environment do
    User.find_each do |user|
      showroom = Showroom.create(:title => "#{user.first_name}'s showroom (#{Date.today})", :user => user)
      fresh_products = Product.pending.order("RAND()").limit(10)     
      showroom.products << fresh_products
    end
  end
end
