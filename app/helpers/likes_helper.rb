module LikesHelper

  def add_like
    set_ideas_and_likes
    unless previous_like?
      new_plus_like
    end
    if previous_like_value == -1
      previous_like.first.destroy
    end
  end

  def add_dislike
    set_ideas_and_likes
    unless previous_like?
      new_dislike
    end
    if previous_like_value == 1
      previous_like.first.destroy
    end
  end

  def previous_like?
    previous_like.length == 1
  end

  def previous_like
    @likes.select {|like| like.user == current_user}
  end

  def previous_like_value
    previous_like? ? previous_like.first.value : 0
  end

  def new_plus_like
    Like.create(user_id: current_user.id, idea: @idea, value: 1)
  end

  def new_dislike
    Like.create(user_id: current_user.id, idea: @idea, value: -1)
  end

  def set_ideas_and_likes
    @idea = Idea.find(params[:idea_id])
    @likes = Like.where("idea_id = #{@idea.id}")
  end
end
