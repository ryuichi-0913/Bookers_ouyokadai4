class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  @book = Book.new
   @user = User.find(params[:id]) # ここを記述
   @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
   end
  end

  def update
  	@user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
  else
    render action: :edit
   end
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to users_path
  end

    def follow
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def followed
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end



end