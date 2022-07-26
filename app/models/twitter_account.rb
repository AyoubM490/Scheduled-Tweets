class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: true

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret = Rails.application.credentials.dig(:twitter, :api_secret)
      config.access_token = "1550053844188536833-MfSQGVnNZnvzLW6V49QyX6CpeFd0fp"
      config.access_token_secret = "N5TXrOd2HGv8rEBCTREc16mpLiqdzgu0E8fZYD0tZ2FRP"
    end
  end
end
