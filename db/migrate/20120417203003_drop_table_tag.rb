class DropTableTag < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :tags
  end
end
