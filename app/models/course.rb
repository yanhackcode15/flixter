class Course < ActiveRecord::Base
  mount_uploader :image, ImageUploader

	belongs_to :user
	has_many :sections
  has_many :enrollments 
	# validates :title, :description, :cost, presence: true
	# validates :cost, :numericality =>{:greater_than_or_equal_to => 0}
  validates :title, :presence => true
  validates :description, :presence => true
  validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  # def authorized? (current_user_id)
  # 	if self.user_id == current_user_id
  # 		true
  # 	end

  # end


  def free?
    cost.zero?
  end

  def premium?
    ! free?
  end
end
