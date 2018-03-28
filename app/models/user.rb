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


  #Instance method which returns the count of positive, negative, and neutral profiles the user searched up
  #Analysis: Option 5 - See the breakdown by positive/negative/netural of the people you creeped.
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
    sentiments_count.each_with_object(Hash.new(0)) { |word,counts| puts counts[word] += 1 }
  end


    #OPTION 2. See the results of the profiles you've looked
    def results
      x = Profile.all.select { |profile| profile.user_id == self.id }
      k = x.map {|profile| profile[:name]}
      v = x.map do |profile|
        if profile[:sentiment_id] == 1
          "Negative"
        elsif profile[:sentiment_id] == 2
          "Positive"
        elsif profile[:sentiment_id] == 3
          "Neutral"
        end
      end
      hash = [k, v].transpose.to_h
    end


end


# What do you want to do?
#
#   CONTINUE:
#     1. Enter another username of a public profile for sentiment analyzing
#
#   ANALYZE THE DATA:
#
#     YOUR RESULTS
#     2. See the results of the profiles you've looked >> User#results
#     3. See the breakdown of sentiments of the profiles you've looked at >> User#sentiment_counts
#
#     ALL RESULTS
#     4. See the number of profiles all users have looked at >> User.num_of_profiles
#     5. See the results of all the profiles looked at by all users >> Profile.results
#     6. See the breakdown of sentiments of all the profiles >> Sentiment.count_of_all
#
#   QUIT
#     7. Exit the application
#
# Please enter the number of your choice above.
