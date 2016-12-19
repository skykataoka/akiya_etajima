class House < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  has_one :article
  has_many :favorites
  has_many :comments
end