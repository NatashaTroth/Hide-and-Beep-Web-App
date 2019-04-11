require 'digest'

class HuntsController < ApplicationController
  before_action :set_hunt, only: [:show, :edit, :update, :destroy]

  # GET /hunts
  # GET /hunts.json
  def index
    @hunts = Hunt.all
  end

  # GET /hunts/1
  # GET /hunts/1.json
  def show
  end

  # GET /hunts/new
  def new
    @hunt = Hunt.new
  end

  # GET /hunts/1/edit
  def edit
    if hunt_param.present?
      @hunt_id = hunt_param
    end
  end

  # POST /hunts
  # POST /hunts.json
  def create
    @hunt = Hunt.new(hunt_params)
    @hunt.authentification_key = create_authentification_key(@hunt.name)
    respond_to do |format|
      if @hunt.save
        format.html { redirect_to hints_path(hunt_id: @hunt.id), notice: 'Hunt was successfully created.' }
        format.json { render :show, status: :created, location: @hunt }
      else
        format.html { render :new }
        format.json { render json: @hunt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hunts/1
  # PATCH/PUT /hunts/1.json
  def update
    respond_to do |format|
      if @hunt.update(hunt_params)
        format.html { redirect_to hints_path(hunt_id: @hunt.id), notice: 'Hunt was successfully updated.' }
        format.json { render :show, status: :ok, location: @hunt }
      else
        format.html { render :edit }
        format.json { render json: @hunt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hunts/1
  # DELETE /hunts/1.json
  def destroy
    @hunt.destroy
    respond_to do |format|
      format.html { redirect_to hunts_url, notice: 'Hunt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hunt
      @hunt = Hunt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hunt_params
      params.require(:hunt).permit(:name, :start_date, :expiry_date, :set_time_limit, :no_time_limit, :winning_code)
    end

    def hunt_param
      if params.has_key?(:hunt_id)
        params.require(:hunt_id) # !!!! WICHTIG PERMIT!!!!
      end
    end

    def create_authentification_key(hunt_name)
      #modified from https://stackoverflow.com/a/88341
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      (0...10).map { o[rand(o.length)] }.join
    end
end
