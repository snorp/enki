class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :message, :null => false
      t.string :link, :null => false
      t.datetime :tweeted_at, :null => false
      t.timestamps
    end

    add_index :tweets, :link
  end

  def self.down
    remove_index :tweets, :link
    drop_table :tweets
  end
end
