class AddResponseBodyAndResponseCodeToSites < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|
      t.text :response_body
      t.integer :response_code
    end
  end

  def self.down
    change_table :sites do |t|
      t.remove :response_body
      t.remove :response_code
    end
  end
end
