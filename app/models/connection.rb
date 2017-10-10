class Connection < ActiveRecord::Base
	belongs_to :user, foreign_key: 'user_id', class_name: 'User'
	belongs_to :contact, foreign_key: 'connection_id', class_name: 'User'
end
