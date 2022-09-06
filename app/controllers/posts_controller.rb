class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました。"
      redirect_to("/posts/index")
    else
      render("posts/new", status: :unprocessable_entity)
    end
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました。"
      redirect_to("/posts/index")
    else
      render("posts/edit", status: :unprocessable_entity)
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to("/posts/index")
  end
end
