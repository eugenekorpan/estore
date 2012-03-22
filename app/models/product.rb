class Product < ActiveRecord::Base
  paginates_per 10

  has_attached_file :image, :styles => { :thumb => "100x100>" }

  has_and_belongs_to_many :showrooms

  scope :pending, lambda { where("DATE_SUB(CURDATE(), INTERVAL 1 MONTH) < products.publish_at") }

  def published?
    @published ||= (publish_at <= Date.today)
  end
end
