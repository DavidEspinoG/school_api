class StudentsController < ApplicationController
  
  def index 
    @students = Student.all
    render json: @students, status: :ok
  end

  def create 
    @student = Student.new email: params[:email], password: params[:password]
    if @student.save
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not_created'}, status: :unprocessable_entity
    end
  end

  def courses
    @student = Student.find_by(id: params[:id])
    @courses = @student.courses
    render json: @courses, status: :ok
  end

  def grades
    @student = Student.find_by(id: params[:id])
    @grades = @student.grades.where(course_id: params[:course_id])
    render json: @grades, status: :ok
  end

  private 

  def student_params
    params.require(:student).permit(:email, :password)
  end
end
