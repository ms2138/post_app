class AddUniqueIndexToFeeds < ActiveRecord::Migration[7.0]
  def change
    add_index :feeds, :name, unique: true
  end
end
