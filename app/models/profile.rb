class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :sentiment

  def sentiment_id(sentiment)
    if sentiment == "negative"
      self.sentiment_id = 1
    elsif sentiment == "positive"
      self.sentiment_id = 2
    elsif sentiment == "neutral"
      self.sentiment_id = 3
    end
  end

  #OPTION 5. See the results of all the profiles looked at by all users >>
  def self.results
    k = Profile.all.map { |profile| profile[:name] }
    v = Profile.all.map do |profile|
      x = profile[:sentiment_id]
      if x == 1
        "Negative"
      elsif x == 2
        "Positive"
      elsif x == 3
        "Neutral"
      end
    end
    hash = [k, v].transpose.to_h
    hash.map {|key, value| puts "#{key} - #{value}"}
  end

  def full_name
    profile_output = RestClient.get("https://www.instagram.com/#{self.name}/?__a=1")
    profile_hash = JSON.parse(profile_output)
    profile_hash['graphql']['user']['full_name']
  end


end
