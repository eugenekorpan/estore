class Showroom < ActiveRecord::Base
  paginates_per 10

  has_many :products, :dependent => :nullify
  belongs_to :user

  validates :title, :presence => true
end
