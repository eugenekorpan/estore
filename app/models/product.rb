class Product < ActiveRecord::Base
  paginates_per 10

  has_attached_file :image, :styles => { :thumb => "100x100>" }

  belongs_to :showroom, :counter_cache => true
end
