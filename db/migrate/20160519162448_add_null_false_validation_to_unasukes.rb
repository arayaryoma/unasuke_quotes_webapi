class AddNullFalseValidationToUnasukes < ActiveRecord::Migration[5.0]
  def change
    change_column_null  :unasukes,  :tweet_time_stamp,  false
    change_column_null  :unasukes,  :tweet_text,        false
    change_column_null  :unasukes,  :tweet_id,          false
  end
end
