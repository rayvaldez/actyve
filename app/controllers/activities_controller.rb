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
    # raise params.inspect
    if @activity.save!
      redirect_to exercise_activity_path(@exercise, @activity)
    else
      render :new
    end
  end

  def show
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @activity = Activity.find_by(id: params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    redirect_to exercise_activities
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :location, :hour, :minute, :calories, :comment, :distance, :exercise_id, :user_id)
  end
end
