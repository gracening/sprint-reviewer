class BadsController < ActionController::API
  before_action :set_bad, only: [:show, :update, :destroy]

  # GET /bads
  # GET /bads.json
  def index
    @bads = Bad.all
    render json: @bads
  end

  # GET /bads/1
  # GET /bads/1.json
  def show
  end

  # POST /bads
  # POST /bads.json
  def create
    @bad = Bad.new(bad_params)

    if @bad.save
      render json: :index, status: :created, location: @bad
    else
      render json: @bad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bads/1
  # PATCH/PUT /bads/1.json
  def update
    if @bad.update(bad_params)
      render :show, status: :ok, location: @bad
    else
      render json: @bad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bads/1
  # DELETE /bads/1.json
  def destroy
    @bad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bad
      @bad = Bad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bad_params
      params.require(:bad).permit(:id, :author, :date, :body, :team)
    end
end
