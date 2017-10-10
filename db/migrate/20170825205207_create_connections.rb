class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :connection_id
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
