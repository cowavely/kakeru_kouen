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
