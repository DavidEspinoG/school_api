class GradesController < ApplicationController

  def index 
    @grades = Grade.all
    render json: @grades, status: :ok
  end

  def create 
    @grade = Grade.new student_id: params[:student_id], 
      course_id: params[:course_id], quarter: params[:quarter], 
      passed: params[:passed], grade: params[:grade]
    if @grade.save
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not_created'}, status: :unprocessable_entity
    end
  end

end
