class StudentsController < ApplicationController
  
  def index 
    @students = Student.all
    render json: @students, status: :ok
  end

  def create 
    @student = Student.new email: params[:email], password: params[:password], 
      name: params[:name]
    if @student.save
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not_created'}, status: :unprocessable_entity
    end
  end

  def destroy 
    @student = Student.find_by_id params[:id]
    if @student.destroy
      render json: {message: 'deleted'}, status: :ok
    else
      render json: {message: 'not_deleted'}, status: :unprocessable_entity
    end
  end

  def show
    @student = Student.find_by_id params[:id]
    render json: @student, status: :ok
  end

  def students_of_course
    @course = Course.find_by(id: params[:course_id])
    if @course
      @students = @course.students
      render json: @students, status: :ok
    else 
      render json: {message: 'not found'}, status: :not_found
    end
  end

  private 

  def student_params
    params.require(:student).permit(:email, :password)
  end
end
