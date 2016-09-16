class WordsController<ApplicationController
  def index
    @words = Word.all
    @user = User.find(params[:user_id])
    render :index
  end

  def show
    @word = Word.find(params[:id])
    @user = User.find(params[:user_id])
    render :show
  end

  def new
    @user = User.find(params[:user_id])
    @word = Word.new
    render :new
  end

  def create

    @word = Word.new(word_params)
    @word.user = User.find(params[:user_id])
    if @word.save
      flash[:notice] = "Word successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @word = Word.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:user_id])
    @word = current_user.words.find(params[:id])
    if @word.update(word_params)
      flash[:notice] = "Word successfully editted!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @word = Word.find(params[:id])
    @word.destroy
    flash[:notice] = "Word successfully deleted!"
    redirect_to root_path
  end

private
  def word_params
    params.require(:word).permit(:img, :title)
  end
end
