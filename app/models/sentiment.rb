class Sentiment < ActiveRecord::Base
  has_many :profiles
  has_many :users, through: :profiles

  #Analysis: Option 6 - See the breakdown by positive/negative/netural of everyone who has been creeped.
  def self.count_of_all
    r = self.all.map { |x| x[:sentiment] }
    r.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  end


end
