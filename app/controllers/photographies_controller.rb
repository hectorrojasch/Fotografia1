class PhotographiesController < ApplicationController
  before_action :authenticate_user!  , except: %i[index show]
  before_action :set_photography, only: %i[ show edit update destroy ]

  # GET /photographies or /photographies.json
  def index
    @photographies = Photography.all
  end

  # GET /photographies/1 or /photographies/1.json
  def show
  end

  # GET /photographies/new
  def new
  
  @photography = current_user.photographies.build
  
  end

  # GET /photographies/1/edit
  def edit
  end

  # POST /photographies or /photographies.json
  def create

  @photography = current_user.photographies.build(photography_params)
  
    respond_to do |format|
      if @photography.save
        format.html { redirect_to photography_url(@photography), notice: "Photography was successfully created." }
        format.json { render :show, status: :created, location: @photography }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographies/1 or /photographies/1.json
  def update
    respond_to do |format|
      if @photography.update(photography_params)
        format.html { redirect_to photography_url(@photography), notice: "Photography was successfully updated." }
        format.json { render :show, status: :ok, location: @photography }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographies/1 or /photographies/1.json
  def destroy
    @photography.destroy

    respond_to do |format|
      format.html { redirect_to photographies_url, notice: "Photography was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photography
      @photography = Photography.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photography_params
      params.require(:photography).permit(:name, :description, :tag_id)
    end
end
