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
  profile2 = name.add_profile(profile)

  captions = get_profiles_from_input(profile)
#  binding.pry
    if captions == nil
      puts "This user is private. Sorry!"
    else
      sentiment = get_sentiment(captions).to_s

        if sentiment == nil
          puts "This user doesn't like captions. Sorry!"
        else
          #binding.pry
          profile2.sentiment_id(sentiment)

          profile2.save

        #   sentiment == "negative"
        #   profile.sentiment_id = negative.id
        #
        #   profile.save
        # elsif sentiment == "positive"
        #   profile.sentiment_id = positive.id
        #   profile.save
        # elsif sentiment == "neutral"
        #   profile.sentiment_id = neutral.id
        #   profile.save
        end
    end
  end


run
