require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sqlite'
)

class User < ActiveRecord::Base
  validates_presence_of :name, :handle
  validates :name, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  has_many :shouts
end

class Shout < ActiveRecord::Base
  validates :likes, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  belongs_to :user
end
