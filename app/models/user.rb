class User < ActiveRecord::Base
  has_many :favorites
  has_many :houses, through: :favorites
  has_many :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def favorite_houses
   houses
 end
  
  def status_admin?
    status === 3
  end
  
end