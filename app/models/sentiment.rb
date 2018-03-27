class Sentiment < ActiveRecord::Base
  has_many :profiles
  has_many :users, through: :profiles
end
