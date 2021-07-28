class PrototypesController < ApplicationController
  before_action :authenticate_user! ,only:[:new,:edit,:destroy]
  before_action :move_to_index, except: [:new,:index,:show,:create]
  def index
    query = "SELECT * FROM prototypes"
    @prototypes = Prototype.find_by_sql(query)
  end

  def new
    @prototype = Prototype.new
 
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
    
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments= @prototype.comments.includes(:user)
    #showアクションにインスタンス変数@commentsを定義し、その投稿に紐づくすべてのコメントを代入するための記述をした

 end


  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  def edit
    

    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
     end

  end

  def update
    @prototype = Prototype.find(params[:id])  
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
     end
  end
end
