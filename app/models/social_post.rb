class SocialPost < ApplicationRecord
  belongs_to :social_content

  enum social_network: {
    twitter: 'twitter',
    google: 'google',
    facebook: 'facebook',
    linkedin: 'linkedin'
  }
end
