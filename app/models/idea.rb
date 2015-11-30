class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true

  def likes_number
    likes = Like.where("idea_id = #{self.id}").reject{|like|like.value == nil}.map{|like|like.value }.inject(:+)
    likes == nil ? 0 : likes
  end
end
