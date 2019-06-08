class Instructor::SpacesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @space = Space.new
  end
  def create
    @course = Course.find(params[:course_id])
    @space =@course.spaces.create(space_params)
    redirect_to instructor_course_path(@course)
  end

  private

  def space_params
    params.require(:space).permit(:title)
  end
end