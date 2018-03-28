


def welcome
  puts "Welcome to the Instagram Sentiment Assessor!"
end

def get_username
  print "
  Please enter your first name: "
  response = gets.chomp
  User.create(username:response)
end

def get_profile
  print "
  Enter the username of a public profile you'd like to analyze the sentiment of: "
  gets.chomp
end


def helper
  puts "
  What do you want to do next?
  CONTINUE:
      1. Enter another username of a public profile for sentiment analyzing
  ANALYZE YOUR RESULTS:
      2. See the results of the profiles you've looked at
      3. See the breakdown of sentiments from the profiles you've looked at
  ANALYZE ALL RESULTS:
      4. See the number of profiles all users have looked at
      5. See the results of all the profiles looked at by all users
      6. See the breakdown of sentiments of all the profiles
  QUIT:
      7. Clear history
      8. Exit the application
  "
  print "Please enter the number of your choice from the options above: "
  gets.chomp
end
