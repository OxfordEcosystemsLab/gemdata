class LeavesController < ApplicationController
  before_action :set_leaf, only: [:show, :edit, :update, :destroy]

  # GET /leaves
  # GET /leaves.json
  def index
    @leaves = Leaf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leaves }
    end
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leaf }
    end
  end

  # GET /leaves/new
  def new
    @leaf = Leaf.new
  end

  # GET /leaves/1/edit
  def edit
  end

  # POST /leaves
  # POST /leaves.json
  def create
    @leaf = Leaf.new(leaf_params)

    respond_to do |format|
      if @leaf.save
        format.html { redirect_to @leaf, notice: 'Leaf was successfully created.' }
        format.json { render json: @leaf, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @leaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update
    respond_to do |format|
      if @leaf.update(leaf_params)
        format.html { redirect_to @leaf, notice: 'Leaf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @leaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leaf.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leaf
      @leaf = Leaf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leaf_params
      params.require(:leaf).permit(:branch_id, :code)
    end
end
