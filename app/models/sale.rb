class Sale < ActiveRecord::Base
  STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
  belongs_to :category
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true, format: { with: /\d{1,7}(\.\d{0,2})?/ }
  validates :city, presence: true
  validates :state, presence: true, inclusion: {in: STATES}

  mount_uploader :image, GearPhotoUploader
end
