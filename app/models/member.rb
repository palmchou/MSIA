class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  ROLES = %w[admin member]

  def human_name
    self.email
  end

  def admin?
    false
    true if self.role == 'admin'
  end
end