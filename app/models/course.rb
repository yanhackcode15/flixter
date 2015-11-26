class Course < ActiveRecord::Base
	belongs_to :user
	# validates :title, :description, :cost, presence: true
	# validates :cost, :numericality =>{:greater_than_or_equal_to => 0}
  validates :title, :presence => true
  validates :description, :presence => true
  validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
end
