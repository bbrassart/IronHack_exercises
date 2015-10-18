class Concert < ActiveRecord::Base
	has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
	validates :band, presence: true
	validates :venue, presence: true
	validates :city, presence: true	
	validates :date, presence: true
	validates :price, presence: true
	validates :description, presence: true
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments

	def self.fetch(date = Date.current)
		Concert.order(:date)
	end

	def to_s()
		[name, email].compact.join(" // ")
	end
end
