class BranchArchitecturesController < ApplicationController
  before_action :set_branch_architecture, only: [:show, :edit, :update, :destroy]

  # GET /branch_architectures
  # GET /branch_architectures.json
  def index
    @branch_architectures = BranchArchitecture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branch_architectures }
    end
  end

  # GET /branch_architectures/1
  # GET /branch_architectures/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch_architecture }
    end
  end

  # GET /branch_architectures/new
  def new
    @branch_architecture = BranchArchitecture.new
  end

  # GET /branch_architectures/1/edit
  def edit
  end

  # POST /branch_architectures
  # POST /branch_architectures.json
  def create
    @branch_architecture = BranchArchitecture.new(branch_architecture_params)

    respond_to do |format|
      if @branch_architecture.save
        format.html { redirect_to @branch_architecture, notice: 'Branch architecture was successfully created.' }
        format.json { render json: @branch_architecture, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @branch_architecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branch_architectures/1
  # PATCH/PUT /branch_architectures/1.json
  def update
    respond_to do |format|
      if @branch_architecture.update(branch_architecture_params)
        format.html { redirect_to @branch_architecture, notice: 'Branch architecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @branch_architecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branch_architectures/1
  # DELETE /branch_architectures/1.json
  def destroy
    @branch_architecture.destroy
    respond_to do |format|
      format.html { redirect_to branch_architectures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_architecture
      @branch_architecture = BranchArchitecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_architecture_params
      params.require(:branch_architecture).permit(:branch_id, :date, :evaluator, :section, :parent, :tip, :diam_inf, :diam_sup, :longitude, :comments)
    end
end
