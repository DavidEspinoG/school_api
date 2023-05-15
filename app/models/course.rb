class Course < ApplicationRecord
  has_many :inscriptions
  has_many :students, :through => :inscriptions

  validates :name, presence: true
end
