class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_space, only: [:new, :create]
  before_action :require_authorized_for_current_lesson, only: [:update]




  def new 
    @lesson = Lesson.new
  end

  def create
    @lesson = current_space.lessons.create(lesson_params)
    redirect_to instructor_course_path(current_space.course)
  end

def update
  current_lesson.update_attributes(lesson_params)
  render plain: 'updated!'
end

  private

def require_authorized_for_current_lesson
  if current_lesson.space.course.user != current_user
    render plain: 'unauthorized', status: :unauthorized
  end
end


def current_lesson
  @current_lesson ||= Lesson.find(params[:id])
end 

  def require_authorized_for_current_space
    if current_space.course.user != current_user
      render plain: 'unauthorized', status: :unauthorized
    end
  end


  helper_method :current_space
  def current_space
    @current_space ||= Space.find(params[:space_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end
end
