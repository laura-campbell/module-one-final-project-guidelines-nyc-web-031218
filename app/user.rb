class User < ActiveRecord::Base
  has_many :profiles
  has_many :sentiments, through: :profiles
end
