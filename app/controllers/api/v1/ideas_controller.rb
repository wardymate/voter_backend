class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    @ideas = []
    Idea.all.each do |idea|
     @ideas << idea.as_json(methods: :likes_number)
    end

    respond_to do |format|
      format.json { render json: @ideas }
    end
  end
end
