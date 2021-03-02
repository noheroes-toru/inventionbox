class PostsController < ApplicationController
  def index  # indexアクションを
    @posts = Post.all  
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def new
  end

  def create
    Post.create(content: params[:content],title: params[:title])
  end

  def destroy
    post = Post.find(params[:id])
    if user_signed_in?
      post.destroy #destroyメソッドを使用し対象のツイートを削除する。
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def ranking
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end
end
