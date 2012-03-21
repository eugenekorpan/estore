`bundle exec rake db:drop`
`bundle exec rake db:create`
`bundle exec rake db:migrate`

require 'factory_girl_rails'

PASSWORD = "password"

def separate
  p "-" * 100
end

def create_users
  separate
  p "Created users:"
  3.times do
    user = Factory.create(:user, :password => PASSWORD, :password_confirmation => PASSWORD)
    p "#{user.full_name} ( #{ user.email } )"
  end
end

def create_admins
  separate
  admin = Factory.create(:admin_user, :password => PASSWORD, :password_confirmation => PASSWORD)
  p "Created Admin:"
  p "#{ admin.email }"
end

def create_showrooms_with_products
  separate
  15.times do
    showroom = Factory.create(:showroom)
    p "Create showrooms #{showroom.title}"
    15.times do
      product = Factory.create(:product, :showroom_id => showroom.id)
      p "created product - #{product.name}"
    end
  end
end


create_users
create_admins
create_showrooms_with_products
