require 'CSV'
require 'open-uri'

TWEETS_CSV_URL = 'https://gist.githubusercontent.com/unasuke/e8449466ca3a5af3a9fe92c103447b7d/raw/bbddcfb07045620426696a0c94c2be0d0d87314f/tweets.csv'
LOCAL_CSV_NAME = "tweets.csv"

open(LOCAL_CSV_NAME, "w") do |f|
  open(TWEETS_CSV_URL) do |t|
    f.write t.read
  end
end

tweets = CSV.table LOCAL_CSV_NAME
tweets.each do |tweet|
  Unasuke.create!(
    tweet_id:         tweet[:tweet_id],
    tweet_text:       tweet[:text].to_s.gsub(/\0/, ''),
    tweet_time_stamp: DateTime.parse(tweet[:timestamp]),
  )
end

Unasuke.where("tweet_text LIKE '@%'").delete_all
Unasuke.where("tweet_text LIKE 'RT %'").delete_all

File.delete LOCAL_CSV_NAME
