class WordsController<ApplicationController
  def index
    @words = Word.all
    render :index
  end

  def show
    @word = Word.find(params[:id])
    render :show
  end

  def new
    @word = Word.new
    render :new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:notice] = "Word successfully added!"
      redirect_to words_path
    else
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
    render :edit
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      flash[:notice] = "Word successfully editted!"
      redirect_to words_path
    else
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:notice] = "Word successfully deleted!"
    redirect_to words_path
  end

private
  def word_params
    params.require(:word).permit(:img, :title)
  end
end
