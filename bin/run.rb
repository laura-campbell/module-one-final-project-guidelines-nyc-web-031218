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
          if name.results.empty?()
            puts "    You have not analyzed any profiles!"
            sleep(2)
          else
            name.results.map {|key, value| puts "   #{key} - #{value}"}
            sleep(2)
          end
        elsif option == '3'
          if name.results.empty?()
            puts "    You have not analyzed any profiles!"
            sleep(2)
          else
            hash = name.results.values.each_with_object(Hash.new(0)) { |result,counts| counts[result] += 1 }
            hash.map {|key, value| puts "   #{key} - #{value}"}
            sleep(2)
          end
        elsif option == '4'
          Profile.all.delete_all
          puts "    History cleared!"
          sleep(2)
        else
          puts "
          That's not a valid command. Please try again."
          sleep(2)
        end
      option = helper
  end
  puts "
  Session ended."
end

def run2(name)
  profile = get_profile
  profile_instance = name.add_profile(profile)
  captions = get_profiles_from_input(profile)
  if captions == false
  elsif captions == nil
    puts "
    This user is private. Sorry!"
    sleep(2)
  else
    sentiment = get_sentiment(captions).to_s
    if sentiment == nil
      puts "
      This user doesn't like captions. Sorry!"
      sleep(2)
    else
      profile_instance.sentiment_id(sentiment)
      profile_instance.save
    end
    puts "
    #{profile}'s sentiment is: #{sentiment.capitalize}"
    sleep(3)
  end
end

run
