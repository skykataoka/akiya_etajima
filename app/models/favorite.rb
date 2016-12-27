class Favorite < ActiveRecord::Base
  belongs_to :house, counter_cache: :favorite_count
  belongs_to :user
end
