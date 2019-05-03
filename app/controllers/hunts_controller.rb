# frozen_string_literal: true

require 'digest'

class HuntsController < ApplicationController
  before_action :set_hunt, only: %i[show edit update destroy]

  # GET /hunts
  # GET /hunts.json
  def index
    # @hunts = Hunt.all.order(:start_date)
    respond_to do |format|
      format.html do
        @hunts = Hunt.where(user_id: current_user.id).order(:updated_at).page(params[:page])
        render :index
      end
      format.json do
        @hunts = Hunt.order(:updated_at)
        render :index
      end
    end
  end

  # GET /hunts/1
  # GET /hunts/1.json
  def show; end

  # GET /hunts/new
  def new
    @hunt = Hunt.new
  end

  # GET /hunts/1/edit
  def edit
    @hunt_id = hunt_param if hunt_param.present?
  end

  # POST /hunts
  # POST /hunts.json
  def create
    @hunt = Hunt.new(hunt_params)
    @hunt.user_id = current_user.id
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
    params.require(:hunt_id) if params.key?(:hunt_id)
  end

  def create_authentification_key(_hunt_name)
    # modified from https://stackoverflow.com/a/88341
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
    (0...10).map { o[rand(o.length)] }.join
  end
end
