class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links, :id => false, :force => true do |t|
      t.string :identifier, :null => false, :primary => true
      t.references :url

      t.timestamps
    end
    add_index :links, :identifier, :unique => true
  end

  def self.down
    remove_index :links, :identifier
    drop_table :links
  end
end
