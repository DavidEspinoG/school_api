class Student < ApplicationRecord
  has_many :grades 
  has_many :courses, :through => :grades
end
