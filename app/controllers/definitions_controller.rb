class DefinitionsController<ApplicationController
  def show
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    render :show
  end

  def new
    @word = Word.find(params[:word_id])
    @definition = @word.definitions.new
    render :new
  end

  def create
    @word = Word.find(params[:word_id])
    @definition = @word.definitions.new(definition_params)
    if @definition.save
      flash[:notice] = "Definition successfully added!"
      redirect_to word_path(@word)
    else
      render :new
    end
  end


private
  def definition_params
    params.require(:definition).permit(:content)
  end
end
