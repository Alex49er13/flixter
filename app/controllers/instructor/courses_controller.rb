class Instructor::CoursesController < ApplicationController
 before_action :authenticate_user!
 before_action :require_authorized_for_current_course, only: [:show]
  def new
    @course = Course.new
  end

   def create
      # :current_course.image
      # :current_course.image.create(course_params[:current_course])
      # :current_course.images.create(photo_params)
      # redirect_to instructor_course_path(:current_course)
      #  current_course.find(params[:id])
      # current_course.images.create(course_params)
      # redirect_to instructor_course_path(course_params)
    
   
    @course = current_user.courses.create(course_params)

    if @course.valid?
    redirect_to instructor_course_path(@course)
  else
    render :new, status: :unprocessable_entity
    end
  end

  def show
# @image = Image.new
   end

  private

  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: "unauthorized", status: :unauthorized
  end
end
  helper_method :current_course
  def current_course
    @current_course ||=Course.find(params[:id])
  end


  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end
end
