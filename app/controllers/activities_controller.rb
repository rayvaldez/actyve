class ActivitiesController < ApplicationController

  def new
    @activities = Activity.all
  end
end
