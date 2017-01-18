class User < ActiveRecord::Base
  has_many :favorites
  has_many :houses, through: :favorites
  has_many :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

 def favorite_houses
   houses
 end
  
  def status_admin?
    status === 3
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.find_by(email: auth.info.email)
  
    unless user
      user = User.new(
        name:     auth.extra.raw_info.name,
        provider: auth.provider,
        uid:      auth.uid,
        email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
        birthday: Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y'),
        introduction: auth.extra.raw_info.about,
        image_url:   auth.info.image,
        password: Devise.friendly_token[0, 20]
      )
      user.save(validate: false)
    end
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
  
  def calculate_profile
    user_columns = [self[:email],
                    self[:name],
                    self[:birthday],
                    self[:introduction],
                    self[:want_to_do],
                    self[:hobby],
                    self[:occupation],
                    self[:sex],
                    self[:spouse],
                    self[:child],
                    self[:number_of_occupants],
                    self[:budget_for_rent],
                    self[:budget_for_buy]
    ]
    insufficient_count = 0
    user_columns.each do |user_column|
      if user_column.blank?
        insufficient_count += 1
      end
    end
    profile_fulfillment_level = 100 - insufficient_count / user_columns.count.to_f * 100
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
  
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
  
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end