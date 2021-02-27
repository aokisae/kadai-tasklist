class TasksController < ApplicationController
    def index
        @messages = Task.all
  end

  def show
      @message = Task.find(params[:id])
  end

  def new
      @message = Task.new
  end

  def create
       @message = Task.new(message_params)

    if @message.save
      flash[:success] = 'Task が正常に作成されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Task が作成されませんでした'
      render :new
    end
  end

  def edit
      @message = Task.find(params[:id])
  end

  def update
      @message = Task.find(params[:id])

    if @message.update(message_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
       @message = Task.find(params[:id])
    @message.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to messages_url
  end
end
