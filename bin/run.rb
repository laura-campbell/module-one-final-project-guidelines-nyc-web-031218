# require_relative 'config/environment.rb'
# require_relative 'config/initializers.rb'
require_relative "../CLI.rb"
require_relative "../API_communicator.rb"


def run
  welcome
  name = get_username
  profile = get_profile
  captions = get_profiles_from_input(profile)
  binding.pry
    if captions == nil
      puts "This user is private. Sorry!"
    else
      sentiment = get_sentiment(captions)
        if sentiment == nil
          puts "This user doesn't like captions. Sorry!"
        else
          puts sentiment
        end
    end
  end


run
