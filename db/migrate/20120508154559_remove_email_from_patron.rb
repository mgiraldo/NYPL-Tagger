class RemoveEmailFromPatron < ActiveRecord::Migration
  def up
  	remove_column :patrons, :email
  end

  def down
  end
end
