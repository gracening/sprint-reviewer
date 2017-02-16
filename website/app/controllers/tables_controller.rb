class TablesController < ApplicationController
  before_action :set_table, only: [:show, :update, :destroy]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
    render json: @tables
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    set_table
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    if @table.save
      render json: :show, status: :created, location: @table
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    set_table
    if @table.update(table_params)
      render :show, status: :ok, location: @table
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    set_table
    @table.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
      render json: @table
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:column_name, :author, :sprint, :body, :team)
    end
end
