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
  run2(name)
  option = helper
    while option != '8'
        if option == '1'
          run2(name)
        elsif option == '2'
          name.profiles.each do |profile|
            puts "#{profile.name} + #{profile.sentiment}"
          end
        elsif option == '3'
          sentiment_counts
        elsif option == '4'
          User.num_of_profiles
        elsif option == '5'
          Profile.results
        elsif option == '6'
          Sentiment.count_of_all
        elsif option == '7'
          User.profiles.delete_all
        else
          puts "That's not a valid command. Please try again."
        end
      option = helper
  end
  puts "Session ended."
end

def run2(name)
  profile = get_profile
  profile_instance = name.add_profile(profile)
  captions = get_profiles_from_input(profile)
  if captions == nil
    puts "
    This user is private. Sorry!"
  else
    sentiment = get_sentiment(captions).to_s
    if sentiment == nil
      puts "
      This user doesn't like captions. Sorry!"
    else
      profile_instance.sentiment_id(sentiment)
      profile_instance.save
    end
    puts "
    #{profile}'s sentiment is: #{sentiment.capitalize}"
  end
end

run
