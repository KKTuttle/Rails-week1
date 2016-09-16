class DefinitionsController<ApplicationController
  def show
    @user = User.find(params[:user_id])
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    render :show
  end

  def new
    @user = User.find(params[:user_id])
    @word = Word.find(params[:word_id])
    @definition = @word.definitions.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])

    @word = Word.find(params[:word_id])
    @definition = @word.definitions.new(definition_params)
    if @definition.save
      flash[:notice] = "Definition successfully added!"
      redirect_to user_words_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])

    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    render :edit
  end

  def update
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    @user = User.find(params[:user_id])
    if @definition.update(definition_params)
      flash[:notice] = "Definition successfully editted"
      redirect_to user_word_path(@user, @word)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @word = Word.find(params[:word_id])
    @definition = Definition.find(params[:id])
    @definition.destroy
    flash[:notice] = "Definition successfully deleted"
    redirect_to user_word_path(@user, @word)
  end

private
  def definition_params
    params.require(:definition).permit(:content)
  end
end
