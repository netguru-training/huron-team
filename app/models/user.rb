class User < ActiveRecord::Base
  ROLES = %w[bar_owner beer_geek]

  rolify
  attr_accessor :is_geek

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # scope :owners, -> { User.select('bars.*').joins(:beers).group('bars.id').having("count(beer_id)>0")} 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
