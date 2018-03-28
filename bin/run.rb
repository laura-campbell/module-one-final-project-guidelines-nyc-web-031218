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
    while option != '5'
        if option == '1'
          run2(name)
        elsif option == '2'
          name.results.map {|key, value| puts "#{key} - #{value}"}
        elsif option == '3'
          hash = name.results.values.each_with_object(Hash.new(0)) { |result,counts| counts[result] += 1 }
          puts hash
        elsif option == '4'
          Profile.all.delete_all
          puts "History cleared!"
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
  if captions == false
  elsif captions == nil
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
