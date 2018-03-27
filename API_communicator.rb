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
  score = 0
  captions.each do |caption|
    score += analyzer.score caption
  end
  analyzer.sentiment (score/captions.length)
end



#   character_hash = JSON.parse(all_characters)
#   character_data = character_hash["results"].find { |data| data["name"] == character }
#   film_urls = character_data["films"]
#   film_data = film_urls.collect { |data| JSON.parse(RestClient.get(data)) }
#   film_data
#
# end
#
# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
#   # films_hash = get_character_movies_from_api("Luke Skywalker")
#   films_hash.each.with_index(1) do |data, index|
#     puts "#{index} " + data['title']
#   end
# end
#
# def show_character_movies(character)
#   films_hash = get_character_movies_from_api(character)
#   parse_character_movies(films_hash)
#   # binding.pry
# end
#
# # show_character_movies("Luke Skywalker")
# ## BONUS
#
# # that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# # can you split it up into helper methods?
