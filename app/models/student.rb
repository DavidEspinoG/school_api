class Student < ApplicationRecord
  has_many :inscriptions
  has_many :courses, :through => :inscriptions, dependent: :destroy
  has_many :grades, dependent: :destroy

  validates :email, uniqueness: true
end
