class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :quarter, uniqueness:  {scope: :course_id, 
    message: "should have only one grade per quarter" }
end
