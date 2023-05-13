class CoursesController < ApplicationController

  def index
    @courses = Course.all
    render json: @courses, status: :ok
  end

  def create 
    @student = Student.find_by(id: params[:student_id])
    @course = @student.courses.new name: params[:name]
    if @course.save
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not created'}, status: :unprocessable_entity
    end
  end

  def show
    # @student = Student.find_by
    @course = Course.find_by(id: params[:id])
    render json: @course, status: :ok
  end
end
