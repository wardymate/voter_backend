class LikesController < ApplicationController
  include LikesHelper

  def new
    set_ideas_and_likes
    unless previous_like?
      new_plus_like
    end
    if previous_like_value == -1
      previous_like.first.destroy
    end
    redirect_to :back
  end

  def dislike
    set_ideas_and_likes
    unless previous_like?
      new_dislike
    end
    if previous_like_value == 1
      previous_like.first.destroy
    end
    redirect_to :back
  end

end