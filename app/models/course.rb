class Course < ApplicationRecord
  has_many :grades, dependent: :destroy
end
