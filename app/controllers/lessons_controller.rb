class LessonsController < ApplicationController
  before_action :require_authorized_user_enrolled_in?, [:show]
  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
