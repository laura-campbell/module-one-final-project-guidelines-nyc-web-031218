class User < ActiveRecord::Base
  has_many :profiles
  has_many :sentiments, through: :profiles

  #Instance method which creates the profile and associates this instance as the user
  def add_profile(userinput)
    profile = Profile.create(name:userinput)
    profile.user_id = self.id
    profile.save
    profile
  end



  #Class method which returns number of profiles each user has creeped
  def self.num_of_profiles
    count_of_profiles = Hash.new()
    self.all.map do |x|
      count_of_profiles[x.username] = x.profiles.length
    end
    count_of_profiles
  end



  def self.most_creeps
    # THIS DOESN'T TAKE IN IF 2 PEOPLE HAVE CREEPED THE SAME # OF PEOPLE
    # NEED TO FIX
    max = self.num_of_profiles.max_by{|k,v| v}
    "#{max[0]} has creeped the most people on this application (#{max[1]})."
  end



  #Instance method which returns the count of positive, negative, and neutral profiles the user searched up
  def sentiments_counts
    #This will the sentiments related to each instance
    x = self.sentiments

    #These two lines are instantiated for the while loop below
    y = 0
    sentiments_count = []

    #This is a loop taking 'positive', 'negative', or 'neutral' from the instances
    while y < x.count
      sentiments_count << x[y][:sentiment]
      y += 1
    end

    #This creates a hash and counts each of the words' occurrences in the array
    #The output will look something like:
    #   {"Positive" => 2, "Neutral" => 1, "Negative" => 3}
    sentiments_count.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  end

end
