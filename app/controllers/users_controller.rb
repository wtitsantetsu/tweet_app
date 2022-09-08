class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id:params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "takibi_ver_main01.jpg"
      )
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました。"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new", status: :unprocessable_entity)
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}", image.read)
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました。"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit", status: :unprocessable_entity)
    end

  end
end
