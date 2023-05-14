class Course < ApplicationRecord
  has_many :grades, dependent: :destroy

  validates :name, presence: true
end
