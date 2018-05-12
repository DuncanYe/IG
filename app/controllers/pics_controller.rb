class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pics = Pic.order(created_at: :desc)
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      flash[:notice] = "pic was created"
       redirect_to @pic
    else
      flash[:alert] = "pic not created"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic
    else
      render :edit
    end
  end

  def destroy
    @pic.destroy
    redirect_to pics_path
  end

  def upvote
    @pic.upvote_by current_user
    redirect_to @pic
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
