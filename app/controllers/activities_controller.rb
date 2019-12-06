class ActivitiesController < ApplicationController
  before_action :set_exercise, only: [:new, :create, :show, :edit, :update]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @activities = Activity.order(created_at: :desc)
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
    if !@activity
      redirect_to exercise_activities_path
      flash[:error] = "Activity unavailable"
    end
  end

  def edit
    if @activity.user_id == current_user.id
      render :edit
    else
      redirect_to exercise_activities_path
    end
  end

  def update
    if @activity.update(activity_params) && @activity.user_id == current_user.id
      redirect_to exercise_activity_path(@exercise, @activity)
    else
      flash[:error] = "Error! You do not have permission to edit this activity!"
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
