class CreateUnasukes < ActiveRecord::Migration[5.0]
  def change
    create_table :unasukes do |t|

      t.timestamps
    end
  end
end
