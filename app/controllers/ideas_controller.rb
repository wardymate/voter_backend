class IdeasController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @ideas = Idea.all.sort_by{|idea|idea.likes_number}.reverse
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to '/ideas'
    else
      render 'new'
    end
  end

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

  def show
    if current_user
      @idea = Idea.find(params[:id])
    else
      flash[:notice] = 'Login to view comments'
      redirect_to '/ideas'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    redirect_to '/ideas'
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = 'Idea deleted successfully'
    redirect_to '/ideas'
  end
end
