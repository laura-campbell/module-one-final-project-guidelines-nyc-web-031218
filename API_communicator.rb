require 'pry'
require 'rest-client'
require 'net/http'
require 'open-uri'
require 'json'
require 'sentimental'
# require_relative "../bin/run.rb"


def get_profiles_from_input(profile)
  profile_output = RestClient.get("https://www.instagram.com/#{profile}/?__a=1")
  profile_hash = JSON.parse(profile_output)
  if profile_hash['graphql']['user']['is_private'] == false
      caption_array= []
      profile_hash['graphql']['user']['edge_owner_to_timeline_media']['edges'].each do |t|
        if t['node']['edge_media_to_caption']['edges'][0] != nil
          caption_array << t['node']['edge_media_to_caption']['edges'][0]['node']['text']
        end
      end
      caption_array
    end
end

def get_sentiment(captions)
  analyzer = Sentimental.new
  analyzer.load_defaults
  x = captions.collect do |caption|
    analyzer.sentiment caption
  end
  x.max_by { |i| x.count(i) }
end
