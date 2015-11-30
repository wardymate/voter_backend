module LikesHelper
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
    @like = Like.new
    @like.user_id = current_user.id
    @like.idea = @idea
    @like.value = 1
    @like.save
  end

  def new_dislike
    @like = Like.new
    @like.user_id = current_user.id
    @like.idea = @idea
    @like.value = -1
    @like.save
  end

  def set_ideas_and_likes
    @idea = Idea.find(params[:idea_id])
    @likes = Like.where("idea_id = #{@idea.id}")
  end
end
