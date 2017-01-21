class Favorite < ActiveRecord::Base
  belongs_to :house, counter_cache: :favorite_count
  belongs_to :user
  
  def self.get_favorite_info(user_id, house_id)
    self.find_by(user_id: user_id, house_id: house_id)
  end
end
