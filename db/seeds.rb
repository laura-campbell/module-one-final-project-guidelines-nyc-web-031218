patricia = User.create(username:"Patricia")
laura = User.create(username:"Laura")
rishi = patricia.add_profile("Rishi")
antoni = laura.add_profile("Antoni")
natalie = laura.add_profile("Natalie")
negative = Sentiment.create(sentiment:"Negative")
positive = Sentiment.create(sentiment:"Positive")
neutral = Sentiment.create(sentiment:"Neutral")
rishi.sentiment_id = negative.id
rishi.save
antoni.sentiment_id = positive.id
antoni.save
natalie.sentiment_id = neutral.id
natalie.save
