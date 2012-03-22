require 'factory_girl_rails'

PASSWORD = "password"

def create_users
  p "--------------------  Created users: -------------------------"
  3.times do
    user = Factory.create(:user, :password => PASSWORD, :password_confirmation => PASSWORD)
    p "#{user.full_name} ( #{ user.email } )"

    p "------------------  Create user showroom  ------------------"
    showroom = Factory.create(:showroom, :user => user)
    p "showroom #{showroom.title} was created"

    p "------------------ Populating showroom with products -------"
    10.times do
      product = Factory.create(:product, :showroom_id => showroom.id)
      p "created product - #{product.name}"
    end
  end
end

def create_admins
  p "-" * 100
  admin = Factory.create(:admin_user, :password => PASSWORD, :password_confirmation => PASSWORD)
  p "Created Admin:"
  p "#{ admin.email }"
end

create_users
create_admins
