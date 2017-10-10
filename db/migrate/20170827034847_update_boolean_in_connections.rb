class UpdateBooleanInConnections < ActiveRecord::Migration
  def change
  	add_column :connections, :accept, :boolean, null: false, default: false
  end
end
