class CnMeasurementsController < ApplicationController
  before_action :set_cn_measurement, only: [:show, :edit, :update, :destroy]

  # GET /cn_measurements
  # GET /cn_measurements.json
  def index
    @cn_measurements = CnMeasurement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cn_measurements }
    end
  end

  # GET /cn_measurements/1
  # GET /cn_measurements/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cn_measurement }
    end
  end

  # GET /cn_measurements/new
  def new
    @cn_measurement = CnMeasurement.new
  end

  # GET /cn_measurements/1/edit
  def edit
  end

  # POST /cn_measurements
  # POST /cn_measurements.json
  def create
    @cn_measurement = CnMeasurement.new(cn_measurement_params)

    respond_to do |format|
      if @cn_measurement.save
        format.html { redirect_to @cn_measurement, notice: 'Cn measurement was successfully created.' }
        format.json { render json: @cn_measurement, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @cn_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cn_measurements/1
  # PATCH/PUT /cn_measurements/1.json
  def update
    respond_to do |format|
      if @cn_measurement.update(cn_measurement_params)
        format.html { redirect_to @cn_measurement, notice: 'Cn measurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cn_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cn_measurements/1
  # DELETE /cn_measurements/1.json
  def destroy
    @cn_measurement.destroy
    respond_to do |format|
      format.html { redirect_to cn_measurements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cn_measurement
      @cn_measurement = CnMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cn_measurement_params
      params.require(:cn_measurement).permit(:leaf_id, :cn_curve_id, :row, :column, :c_percent, :n_percent, :cn_ration, :n15_delta, :c13_delta)
    end
end
