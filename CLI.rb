


def welcome
  puts "Welcome to the Instagram Sentiment Assessor!"
end

def get_username
  print "Please enter your first and last name: "
  response = gets.chomp
  User.create(username:response)
end

def get_profile
  print "Enter the username of a public profile you'd like to analyze the sentiment of: "
  gets.chomp
end


def help
  puts "Options to do:
    1. Enter another username of a public profile for sentiment analyzing
    2. See all the profiles you've looked at
    3. See the breakdown of sentiments from the profiles you've looked at
  "
  print "What would you like to do? (input a number from options above) "
  gets.chomp
end
