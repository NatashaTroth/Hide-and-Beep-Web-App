class WorkingTitlesController < ApplicationController
  before_action :set_working_title, only: [:show, :edit, :update, :destroy]

  # GET /working_titles
  # GET /working_titles.json
  def index
    @working_titles = WorkingTitle.order("created_at DESC").all
  end

  # GET /working_titles/1
  # GET /working_titles/1.json
  def show
  end

  # GET /working_titles/new
  def new
    @working_title = WorkingTitle.new
  end

  # GET /working_titles/1/edit
  def edit
  end

  # POST /working_titles
  # POST /working_titles.json
  def create
    @working_title = WorkingTitle.new(working_title_params)

    respond_to do |format|
      if @working_title.save
        format.html { redirect_to working_titles_url, notice: 'Working title was successfully created.' }
        format.json { render :show, status: :created, location: @working_title }
      else
        format.html { render :new }
        format.json { render json: @working_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_titles/1
  # PATCH/PUT /working_titles/1.json
  def update
    respond_to do |format|
      if @working_title.update(working_title_params)
        format.html { redirect_to @working_title, notice: 'Working title was successfully updated.' }
        format.json { render :show, status: :ok, location: @working_title }
      else
        format.html { render :edit }
        format.json { render json: @working_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_titles/1
  # DELETE /working_titles/1.json
  def destroy
    @working_title.destroy
    respond_to do |format|
      format.html { redirect_to working_titles_url, notice: 'Working title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_title
      @working_title = WorkingTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_title_params
      params.require(:working_title).permit(:title)
    end
end
