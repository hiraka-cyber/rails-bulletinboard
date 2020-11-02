class ThreadersController < ApplicationController
  def index
      @threaders = Threader.all
  end

  def show
      @threader = Threader.find(params[:id])
  end

  def new
      @threader = Threader.new
  end

  def edit
      @threader = Threader.find(params[:id])
  end

  def create
      @threader = Threader.new(thread_params)

      if @threader.save
          redirect_to @threader
      else
          render 'new'
      end
  end

  def update
      @threader = Threader.find(params[:id])

      if @threader.update(thread_params)
          redirect_to @threader
      else
          render 'edit'
      end
  end

  def destroy
      @threader = Threader.find(params[:id])
      @threader.destroy

      redirect_to threaders_path
  end

  private
      def thread_params
          params.require(:threader).permit(:title, :text)
      end
end
