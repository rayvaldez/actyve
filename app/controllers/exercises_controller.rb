class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @exercises = Exercise.all
  end

  def show
    @activities = Activity.type(@exercise)
  end

  private

  def set_exercise
    @exercise = Exercise.find_by_id(params[:id])
  end
end
