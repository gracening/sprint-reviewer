class ImprovesController < ActionController::API
  before_action :set_improfe, only: [:show, :update, :destroy]

  # GET /improves
  # GET /improves.json
  def index
    @improves = Improve.all
    render json: @improves
  end

  # GET /improves/1
  # GET /improves/1.json
  def show
  end

  # POST /improves
  # POST /improves.json
  def create
    @improfe = Improve.new(improfe_params)

    if @improfe.save
      render json: :index, status: :created, location: @improfe
    else
      render json: @improfe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /improves/1
  # PATCH/PUT /improves/1.json
  def update
    if @improfe.update(improfe_params)
      render :show, status: :ok, location: @improfe
    else
      render json: @improfe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /improves/1
  # DELETE /improves/1.json
  def destroy
    @improfe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improfe
      @improfe = Improve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def improfe_params
      params.require(:improfe).permit(:id, :author, :date, :body, :team)
    end
end
