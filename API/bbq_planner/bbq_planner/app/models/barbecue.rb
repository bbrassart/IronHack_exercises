class Barbecue < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :date, presence: true
  has_and_belongs_to_many :users
  has_many :items
end
