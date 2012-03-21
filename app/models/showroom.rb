class Showroom < ActiveRecord::Base
  paginates_per 10

  has_many :products

  validates :title, :presence => true
end
