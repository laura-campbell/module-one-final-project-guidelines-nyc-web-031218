class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :sentiment

  def sentiment_id(sentiment)
    if sentiment == "negative"
      self.sentiment_id = 1
    elsif sentiment == "positive"
      self.sentiment_id = 2
    elsif sentiment == "neutral"
      self.sentiment_id = 3
    end
  end
end
