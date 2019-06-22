class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def new
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @activity = Activity.new
  end

  def create
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @activity = current_user.activities.new(activity_params)

    if @activity.save!
      redirect_to exercise_activity_path(@exercise, @activity)
    else
      render :new
    end
  end

  def show
    @activity = Activity.find_by(id: params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :location, :hour, :minute, :calories, :comment, :distance, :exercise_id, :user_id)
  end
end
