class LessonsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :require_current_lesson_space_course_current_user_enrolled_in?, [:show]
  # if user.enrolled_in? != user
  #  redirect_to root_path,alert:'Error Message Here'
  # end
  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
