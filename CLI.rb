


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
