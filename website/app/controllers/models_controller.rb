class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    if @model.save
      render :show, status: :created, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    if @model.update(model_params)
      render :show, status: :ok, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:table, :author, :date, :body, :team)
    end
end
