class User < ActiveRecord::Base
	has_secure_password

	has_many :connections, foreign_key: :user_id, class_name: "Connection"
	has_many :contacts, through: :connections, source: :contact

	has_many :connection, foreign_key: :connection_id, class_name: "Connection"
	has_many :connected_to, through: :connection, source: :user 


	validates :username, :password, :description, presence: true
	validates :email, presence: true, uniqueness: true
	validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end