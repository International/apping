class AddRequestTypeAndRequestBodyToSites < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|
      t.string :request_type
      t.text :request_body
    end
  end

  def self.down
    change_table :sites do |t|
      t.remove :request_type
      t.remove :request_body
    end
  end
end
