class ActivitiesController < ApplicationController
  before_action :set_exercise, only: [:new, :create, :show, :edit, :update]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @activities = Activity.all.reverse
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to exercise_activity_path(@exercise, @activity)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to exercise_activity_path(@exercise, @activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy

    redirect_to exercise_activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :location, :hour, :minute, :calories, :comment, :distance, :exercise_id, :user_id)
  end

  def set_exercise
    @exercise = Exercise.find_by_id(params[:exercise_id])
  end

  def set_activity
    @activity = Activity.find_by(id: params[:id])
  end
end
