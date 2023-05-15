class LoginController < ApplicationController

  def create
    @admin = Admin.new email: params[:email], password: params[:password]
    if @admin.save
      render json: {message: 'created'}, status: :ok
    else
      render json: {message: 'not_created'}, status: :unprocessable_entity
    end
  end

  def student
    @student = Student.find_by email: params[:email]
    if params[:password] == @student.password
      render json: {
        logged: true, 
        student: @student
      }, status: :ok
    else
      render json: {logged: false}, status: :unauthorized
    end
  end
  
  def admin
    @admin = Admin.find_by email: params[:email]
    if @admin 
      if params[:password] == @admin.password
        render json: {
          logged: true, 
          admin: @admin
        }, status: :ok
      else
        render json: {logged: false}, status: :unauthorized
      end
    else
      render json: {message: 'not_found'}, status: :unauthorized 
    end
  end

end
