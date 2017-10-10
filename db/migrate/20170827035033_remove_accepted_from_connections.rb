class RemoveAcceptedFromConnections < ActiveRecord::Migration
  def change
    remove_column :connections, :accepted, :boolean
  end
end
