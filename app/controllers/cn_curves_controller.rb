class CnCurvesController < ApplicationController
  before_action :set_cn_curve, only: [:show, :edit, :update, :destroy]

  # GET /cn_curves
  # GET /cn_curves.json
  def index
    @cn_curves = CnCurve.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cn_curves }
    end
  end

  # GET /cn_curves/1
  # GET /cn_curves/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cn_curve }
    end
  end

  # GET /cn_curves/new
  def new
    @cn_curve = CnCurve.new
  end

  # GET /cn_curves/1/edit
  def edit
  end

  # POST /cn_curves
  # POST /cn_curves.json
  def create
    @cn_curve = CnCurve.new(cn_curve_params)

    respond_to do |format|
      if @cn_curve.save
        format.html { redirect_to @cn_curve, notice: 'Cn curve was successfully created.' }
        format.json { render json: @cn_curve, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @cn_curve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cn_curves/1
  # PATCH/PUT /cn_curves/1.json
  def update
    respond_to do |format|
      if @cn_curve.update(cn_curve_params)
        format.html { redirect_to @cn_curve, notice: 'Cn curve was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cn_curve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cn_curves/1
  # DELETE /cn_curves/1.json
  def destroy
    @cn_curve.destroy
    respond_to do |format|
      format.html { redirect_to cn_curves_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cn_curve
      @cn_curve = CnCurve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cn_curve_params
      params.require(:cn_curve).permit(:c_enr_1, :n_enr_1, :c_percent_1, :n_percent_1, :cn_ratio_1)
    end
end
