class Student < ApplicationRecord
  has_many :courses, :through => :inscriptions
  has_many :grades 
end
