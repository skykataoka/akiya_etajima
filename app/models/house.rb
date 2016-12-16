class House < ActiveRecord::Base
  has_one :article
  has_many :favorites
  has_many :comments
end