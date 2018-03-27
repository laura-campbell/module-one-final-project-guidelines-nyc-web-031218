require_relative "../config/environment.rb"
# require_relative 'config/initializers.rb'
require_relative "../CLI.rb"
require_relative "../API_communicator.rb"
# require_relative "../app/models/profile.rb"
# require_relative "../app/models/sentiment.rb"
# require_relative "../app/models/user.rb"


def run
  welcome
  name = get_username
  profile = get_profile
  profile_instance = name.add_profile(profile)
  captions = get_profiles_from_input(profile)
  if captions == nil
    puts "This user is private. Sorry!"
  else
    sentiment = get_sentiment(captions).to_s
    if sentiment == nil
      puts "This user doesn't like captions. Sorry!"
    else
      profile_instance.sentiment_id(sentiment)
      profile_instance.save
    end
    puts "#{profile}'s sentiment is: #{sentiment.capitalize}"
  end
  option = help
end


run
