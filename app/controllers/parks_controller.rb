class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "nagareyama", :password => "iwark", only: [:show, :edit, :update, :destroy]

  def home

  end

  def search
    @parks = Park.all
    @flags = params[:flags]
    @query_flags = 0
    if params[:flags].present?
      params[:flags].each do |k, v|
        if v == "1"
          @query_flags = @query_flags | Park::FLAGS[k.to_sym]
        end
      end
      @parks = @parks.where("(flags & ?) == ?", @query_flags, @query_flags)
    end

    if params[:tags].present? 
      @parks = @parks.tagged_with(params[:tags])
      @tags = params[:tags]
    end
    
    respond_to do |format|
        format.html
        format.json {render json: {count: @parks.count}}
    end
  end

  def load_parks
    Spreadsheet.client_encoding = 'UTF-8'

    book = Spreadsheet.open 'app/assets/parks.xls'
    sheet1 = book.worksheet 0 # スプレッドシートの1枚目を指定
    Park.delete_all
    i=0
    sheet1.each do |row|
      # do something interesting with a row
      # if i>0
        if i > 0
          park_flags = {
              has_toilet: row[5],
              has_water: row[6],
              has_nature: row[4],
              has_bench: row[7],
              has_parking: row[8],
              has_sports: row[9],
              has_playground: row[10]
          }
          park = Park.new(
            name: row[0],
            address: row[3],
            description: row[2],
            hasToilet: row[5],
            hasWater: row[6],
            hasNature: row[4],
            hasBench: row[7],
            hasParking: row[8],
            hasSports: row[9],
            hasPlayground: row[10],
            img_url: row[1]
          )
          park.set_flags(park_flags)
          park.save
        end
        logger.info(row)
      # end
      i+=1
    end
  end

  # GET /parks
  # GET /parks.json
  def index
    @parks = Park.all
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
  end

  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
  end

  # POST /parks
  # POST /parks.json
  def create

    @park = Park.new(park_params)
    @park.set_flags(params[:park][:flags])


    respond_to do |format|
      if @park.save
        format.html { redirect_to @park, notice: 'Park was successfully created.' }
        format.json { render action: 'show', status: :created, location: @park }
      else
        format.html { render action: 'new' }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    respond_to do |format|
      if @park.update(park_params)
        format.html { redirect_to @park, notice: 'Park was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park.destroy
    respond_to do |format|
      format.html { redirect_to parks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      params.require(:park).permit(:name, :address, :description, :image, :tag_list)
    end
end
