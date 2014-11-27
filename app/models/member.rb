class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  ROLES = %w[admin member]
  validates :member_name, :role, :phone_number, :address, :brief, presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates :role, inclusion: { in: ['indiv', 'party', 'admin'], message: '請選擇正確的會員類型。' }


  def admin?
    false
    true if self.role == 'admin'
  end

  def self.showable_members
    Member.where(show: true)
  end

  def self.paginated(page)
    self.paginate(page: page, per_page: 10)
  end

  def member_type
    case self.role
      when 'indiv'
        :indiv_member
      when 'party'
        :party_member
    end

  end

end