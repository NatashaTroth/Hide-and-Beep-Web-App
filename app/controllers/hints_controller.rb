# frozen_string_literal: true

class HintsController < ApplicationController
  before_action :set_hint, only: %i[show edit update destroy]

  # GET /hints
  # GET /hints.json
  def index
    if hunt_param.present?
      @hints = Hint.all.where(['hunt_id=?', hunt_param]).order(:position)
      @hunt_id = hunt_param
      # sum = Hint.all
    else
      redirect_to home_path
    end
  end

  def sort
    if params[:hint].present?
      params[:hint].each_with_index do |id, index|
        Hint.where(id: id).update_all(position: index + 1)
      end
    end
    head :ok
  end

  # GET /hints/1
  # GET /hints/1.json
  # def show
  # end

  # GET /hints/new
  def new
    @hunt_id = hunt_param
    @hint = Hint.new(hunt_id: @hunt_id)
  end

  # GET /hints/1/edit
  def edit
    @hunt_id = hunt_param
  end

  # POST /hints
  # POST /hints.json
  def create
    @hint = Hint.new(hint_params)

    respond_to do |format|
      if @hint.save
        format.html { redirect_to hints_path(hunt_id: @hint.hunt_id), notice: 'Hint was successfully created.' }
        format.json { render :show, status: :created, location: @hint }
      else
        format.html { render :new }
        format.json { render json: @hint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hints/1
  # PATCH/PUT /hints/1.json
  def update
    respond_to do |format|
      if @hint.update(hint_params)
        format.html { redirect_to hints_path(hunt_id: @hint.hunt_id), notice: 'Hint was successfully updated.' }
        format.json { render :show, status: :ok, location: @hint }
      else
        format.html { render :edit }
        format.json { render json: @hint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hints/1
  # DELETE /hints/1.json
  def destroy
    @hint.destroy
    respond_to do |format|
      format.html { redirect_to hints_path(hunt_id: @hint.hunt_id), notice: 'Hint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hint
    @hint = Hint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hint_params
    params.require(:hint).permit(:order, :location_name, :latitude, :longitude, :text, :hunt_id, :position)
  end

  def hunt_param
    params.require(:hunt_id) if params.key?(:hunt_id)
  end
end
