class Instructor::SpacesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course
  def new
    @space = Space.new
  end
  def create
    @space = @course.spaces.create(space_params)
    redirect_to instructor_course_path(Current_course)
  end

  private

  def requiree_authorized_for_current_course
    if current_course.user != current_user
      render plain: "unauthorized", status: :unauthorized

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def space_params
    params.require(:space).permit(:title)
  end
end