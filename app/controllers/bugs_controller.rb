class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)

    if @bug.save
      redirect_to @bug, notice: 'Bug was successfully created'
    else
      render action: 'new'
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
  end

  private
    def bug_params
      params.require(:bug).permit(:twitter_handle, :short_description, :long_description)
    end
end