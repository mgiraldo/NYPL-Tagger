class ConvertUrlLongtext < ActiveRecord::Migration
  def up
    change_column :bookmarks, :original_url, :text
  end

  def down
    change_column :bookmarks, :original_url, :string
  end
end
