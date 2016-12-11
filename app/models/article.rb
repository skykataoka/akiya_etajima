class Article < ActiveRecord::Base
  belongs_to :house
  has_many :images
end
