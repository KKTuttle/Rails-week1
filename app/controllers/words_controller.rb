class WordsController<ApplicationController
  def index
    @words = Word.all
    render :index
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def 

  end

  def

  end

  def

  end

  def

  end

  def

  end
