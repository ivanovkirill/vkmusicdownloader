class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider,
                   :url => access_token.url,
                   :username => access_token.info.name,
                   :email => access_token.uid+'@vk.com',
                   :password => Devise.friendly_token[0,20],
                   :image => access_token.info.image
                  ) 
    end
  end
end
