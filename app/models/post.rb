class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%").or(where('content LIKE(?)', "%#{search}%"))
    else
      Post.all
    end
  end
end
