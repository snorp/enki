class AddAkismetField < ActiveRecord::Migration
  def self.up
    add_column :comments, :akismet, :string, :default => 'ham'
  end

  def self.down
    remove_column :comments, :akismet
  end
end
