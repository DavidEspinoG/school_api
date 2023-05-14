class GradesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid do 
    render json: {message: 'not_created'}, status: :unprocessable_entity
  end
  def index 
    @student = Student.find_by(id: params[:student_id])
    @grades = @student.grades
    render json: @grades, status: :ok
  end

  def create 
    @student = Student.find_by(id: params[:student_id])
    @grade = @student.grades.new course_id: params[:course_id], quarter: params[:quarter], 
      passed: params[:passed], grade: params[:grade]
    if @grade.save
      GradesMailer.with(student: @student).new_grade.deliver_later
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not_created'}, status: :unprocessable_entity
    end
  end

  def destroy 
    @grade = Grade.find_by(id: params[:id])
    if @grade 
      @grade.destroy
    end
    
    render json: {message: 'deleted'}, status: :ok
    

  end

  def grades_of_course
    @student = Student.find_by(id: params[:student_id])
    @grades = @student.grades.where(course_id: params[:course_id])
    render json: @grades, status: :ok
  end

end
