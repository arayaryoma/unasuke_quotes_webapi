class AddUnasukeTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :unasukes, :tweet_time_stamp, :datetime
    add_column :unasukes, :tweet_id, :string
    add_column :unasukes, :tweet_text, :string
  end
end
