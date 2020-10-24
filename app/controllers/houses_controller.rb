class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy, :toggle_favorite, :toggle_hidden]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        HouseProperty.add_house(@house)
        format.html { redirect_to houses_url, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1/toggle_favorite
  # PATCH/PUT /houses/1/toggle_favorite.json
  def toggle_favorite
    @house.update(favorite: params[:favorite] == '1')
  end

  # PATCH/PUT /houses/1/toggle_hidden
  # PATCH/PUT /houses/1/toggle_hidden.json
  def toggle_hidden
    @house.update(hidden: params[:hidden] == '1')
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to house_url(@house), notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(:photo, :address, :comment, :price, :zillow_id)
    end
end
