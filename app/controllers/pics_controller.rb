class PicsController < ApplicationController

  def index
    @pics = Pic.order(created_at: :desc)
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new

    if @pic.save(params_pic)
       redirect_to pics_path 
    else
      render :new
    end
  end

  private

  def params_pic
    params.require(:pic).permit(:title, :description)
  end

end
