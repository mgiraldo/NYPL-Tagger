class AddOldTables < ActiveRecord::Migration
  def self.up
    create_table :patrons do |t|
      t.string :first_name
      t.string :last_name
      t.string :card_number
      t.string :password
      t.string :bio
      t.string :city
      t.string :state
      t.string :email

      t.timestamps
    end
    
    create_table :bookmarks do |t|
      t.string :type
      t.string :uuid
      t.string :title
      t.string :original_url
      t.string :remote_ref
      t.timestamps
    end
    
    create_table :bookmarks_patrons, :id => false do |t|
      t.string :bookmark_id
      t.string :patron_id
    end
    
    Patron.create(
      :first_name   => "Michael",
      :last_name    => "Lascarides",
      :card_number  => "23333073913020",
      :password     => "3333",
      :bio          => "Hacker, painter",
      :city         => "Brooklyn",
      :state        => "NY",
      :email        => "mlascarides@gmail.com"
    )
    
  end

  def self.down
    drop_table :patrons
    drop_table :bookmarks
    drop_table :bookmarks_patrons
  end

end
