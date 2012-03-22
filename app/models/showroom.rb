class Showroom < ActiveRecord::Base
  paginates_per 10

  has_and_belongs_to_many :products

  belongs_to :user

  validates :title, :presence => true
end
