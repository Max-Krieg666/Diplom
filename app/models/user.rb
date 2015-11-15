class User < ActiveRecord::Base
	self.primary_key = 'id'

  ROLES = %w(Студент Преподаватель Администратор)
  has_secure_password

  before_validation :set_default_role

  validates_presence_of :login, :email, :password, :role

  validates :login, length: {minimum: 3 ,maximum: 24},
            uniqueness: true
  validates :password, length: { minimum: 6 }, if: "password.present?"
  validates :email, uniqueness: { case_sensitive: false },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :role, inclusion: { in: 0...ROLES.size }

  def student?
    role==0
  end

  def teacher?
    role==1 || administrator?
  end

  def administrator?
    role==2
  end

  def set_default_role
    self.role||=0
  end

  def role_name
    ROLES[role]
	end

	def fio
		"#{lastname} #{firstname} #{patronymic}"
	end
end
