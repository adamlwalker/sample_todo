class AddClearedToItems < ActiveRecord::Migration
  def change
    add_column :items, :cleared, :boolean
  end
end
