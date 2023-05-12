class Student < ApplicationRecord
  has_many :courses, :through => :inscriptions
end
