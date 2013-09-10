class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.string :user_screen_name

      t.timestamps
    end
  end
end
