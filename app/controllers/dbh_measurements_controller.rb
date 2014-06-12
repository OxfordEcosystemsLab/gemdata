class DbhMeasurementsController < ApplicationController
  before_action :set_dbh_measurement, only: [:show, :edit, :update, :destroy]

  # GET /dbh_measurements
  # GET /dbh_measurements.json
  def index
    @dbh_measurements = DbhMeasurement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dbh_measurements }
    end
  end

  # GET /dbh_measurements/1
  # GET /dbh_measurements/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dbh_measurement }
    end
  end

  # GET /dbh_measurements/new
  def new
    @dbh_measurement = DbhMeasurement.new
  end

  # GET /dbh_measurements/1/edit
  def edit
  end

  # POST /dbh_measurements
  # POST /dbh_measurements.json
  def create
    @dbh_measurement = DbhMeasurement.new(dbh_measurement_params)

    respond_to do |format|
      if @dbh_measurement.save
        format.html { redirect_to @dbh_measurement, notice: 'Dbh measurement was successfully created.' }
        format.json { render json: @dbh_measurement, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @dbh_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dbh_measurements/1
  # PATCH/PUT /dbh_measurements/1.json
  def update
    respond_to do |format|
      if @dbh_measurement.update(dbh_measurement_params)
        format.html { redirect_to @dbh_measurement, notice: 'Dbh measurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dbh_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dbh_measurements/1
  # DELETE /dbh_measurements/1.json
  def destroy
    @dbh_measurement.destroy
    respond_to do |format|
      format.html { redirect_to dbh_measurements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dbh_measurement
      @dbh_measurement = DbhMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dbh_measurement_params
      params.require(:dbh_measurement).permit(:tree_id, :value)
    end
end
