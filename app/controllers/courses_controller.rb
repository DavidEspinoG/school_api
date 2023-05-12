class CoursesController < ApplicationController

  def index
    @courses = Course.all
    render json: @courses, status: :ok
  end

  def create 
    @course = Course.new name: params[:name]
    if @course.save
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not created'}, status: :unprocessable_entity
    end
  end
end
