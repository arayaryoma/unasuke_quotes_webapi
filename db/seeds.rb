# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'CSV'
tweets = CSV.table('/Users/Ryoma/Downloads/108252390_63123566238ddc7bdc1229c0a4b0d4847bdefb75/tweets.csv')
#tweets = CSV.table('/Users/Ryoma/allajah_hack/terakoya/unasuke_quotes/testfile.csv')
tweets.each do |tweet|
  if tweet[:in_reply_to_status_id].blank? && tweet[:retweeted_status_id].blank?
    Unasuke.create!({tweet_id: tweet[:tweet_id], tweet_time_stamp: DateTime.parse(tweet[:timestamp]), tweet_text: tweet[:text]})
  end
end
