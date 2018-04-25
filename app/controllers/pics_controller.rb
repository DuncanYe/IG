class PicsController < ApplicationController

  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.order(created_at: :desc)
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
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

  private

  def pic_params
    params.require(:pic).permit(:title, :description)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
