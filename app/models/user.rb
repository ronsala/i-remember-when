# frozen_string_literal: true

# Describes a member of the community's account.
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
  has_many :memories
  has_many :events, through: :memories

  validates :username, presence: true, uniqueness: true

  #TODO fix Google auth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
    end
  end
end
