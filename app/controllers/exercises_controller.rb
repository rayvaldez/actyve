class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      render :new
    end
  end

  def show
    @exercise = Exercise.find_by_id(params[:id])
  end

  def destroy
    @exercise = Exercise.find_by_id(params[:id])
    @exercise.destroy

    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
