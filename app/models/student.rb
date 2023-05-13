class Student < ApplicationRecord
  has_many :grades 
  has_many :courses, :through => :grades, :dependent => :destroy

  validates :email, uniqueness: true
end
