class LikesController < ApplicationController
  include LikesHelper

  def new
    add_like
    redirect_to :back
  end

  def dislike
    add_dislike
    redirect_to :back
  end

end
