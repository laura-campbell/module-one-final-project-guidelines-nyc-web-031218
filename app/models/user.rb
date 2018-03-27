class User < ActiveRecord::Base
  has_many :profiles
  has_many :sentiments, through: :profiles

  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  #Class method which shows all of the users who has used the database
  def self.all?
    ALL
  end

  #Instance method which creates the profile and associates this instance as the user
  def add_profile


  #Instance method which shows all profiles which the user has lurked
  def profiles
    self.profiles
  end

  #Class method which shows
  def self.most_profiles
    self.all
  end

  def sentiments_pie
  end

end
