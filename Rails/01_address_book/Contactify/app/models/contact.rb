class Contact < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true
	def to_s
    	[name, address, phone1, phone2, email1, email2].compact.join(" // ")
    end

    def show_name
    	name
    end

    def new
    	@project = Project.new
    end
end
