class GradesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.grades_mailer.new_grade.subject
  #
  def new_grade
    @student = params[:student]
    @student_name= @student.name

    mail to: @student.email
  end
end
