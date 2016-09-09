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

  def edit
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    render :edit
  end

  def update
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])

    if @definition.update(definition_params)
      flash[:notice] = "Definition successfully editted"
      redirect_to word_path(@word)
    else
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    @definition.destroy
    flash[:notice] = "Definition successfully deleted"
    redirect_to word_path(@word)
  end

private
  def definition_params
    params.require(:definition).permit(:content)
  end
end
