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

private
  def word_params
    params.require(:word).permit(:img, :title)
  end
end
