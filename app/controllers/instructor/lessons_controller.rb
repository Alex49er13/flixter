class Instructor::LessonsController < ApplicationController
  def new 
    @space = Space.find(params[:space_id])
    @lesson = Lesson.new
  end

    def create
    @space = Space.find(params[:space_id])
    @lesson = @space.lessons.create(lesson_params)
    redirect_to instructor_course_path(@space.course)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
