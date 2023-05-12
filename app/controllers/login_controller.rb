class LoginController < ApplicationController

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

end
