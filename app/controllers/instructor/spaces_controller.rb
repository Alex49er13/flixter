class Instructor::SpacesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course
  def new
    @space = Space.new
  end
  def create
    @space = current_course.spaces.create(space_params)
    redirect_to instructor_course_path(current_course)
  end

  private

  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: "unauthorized", status: :unauthorized
    end
  end
  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def space_params
    params.require(:space).permit(:title)
  end
end