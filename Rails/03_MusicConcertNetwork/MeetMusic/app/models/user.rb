class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    unless self.roles
      self.roles = :user
    end
  end
end
