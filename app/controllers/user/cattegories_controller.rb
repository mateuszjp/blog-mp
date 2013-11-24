class User::CattegoriesController < UserController
  before_action :set_cattegory, only: [:show, :edit, :update, :destroy]

  # GET /cattegories
  # GET /cattegories.json
  def index
  end

  # GET /cattegories/1
  # GET /cattegories/1.json
  def show
    @cattegory_posts = @cattegory.posts
  end

  # GET /cattegories/new
  def new
    @cattegory = Cattegory.new
  end

  # GET /cattegories/1/edit
  def edit
  end

  # POST /cattegories
  # POST /cattegories.json
  def create
    @pass
    @cattegory = CreateCattegoryService.new.tap do |x|
      x.createCattegory(cattegory_params)
      #x.createCattegory(params)
      @pass = x.pass
    end.cattegory

    respond_to do |format|
      if @pass#@cattegory.pass
        format.html { redirect_to @cattegory, notice: 'Cattegory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cattegory }
      else
        format.html { render action: 'new'}
        format.json { render json: @cattegory.errors, status: :unprocessable_entity }
      end
    end
    #@cattegory = Cattegory.new(cattegory_params)
    #
    #respond_to do |format|
    #  if @cattegory.save
    #    format.html { redirect_to @cattegory, notice: 'Cattegory was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @cattegory }
    #  else
    #    format.html { render action: 'new'}
    #    format.json { render json: @cattegory.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /cattegories/1
  # PATCH/PUT /cattegories/1.json
  def update
    respond_to do |format|
      if @cattegory.update(cattegory_params)
        format.html { redirect_to user_cattegory_path(@cattegory), notice: 'Cattegory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cattegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cattegories/1
  # DELETE /cattegories/1.json
  def destroy
    @cattegory.destroy
    respond_to do |format|
      format.html { redirect_to cattegories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cattegory
      @cattegory = Cattegory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cattegory_params
      params.require(:cattegory).permit(:name)
    end
end
