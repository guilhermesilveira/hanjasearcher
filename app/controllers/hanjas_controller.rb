class HanjasController < ApplicationController
  before_action :set_hanja, only: [:show, :edit, :update, :destroy]

  # GET /hanjas
  # GET /hanjas.json
  def index
    @hanjas = Hanja.all
    @combinations = Hanjacombination.all
  end

  # GET /hanjas/1
  # GET /hanjas/1.json
  def show
  end

  # GET /hanjas/new
  def new
    @hanja = Hanja.new
  end

  # GET /hanjas/1/edit
  def edit
  end

  # POST /hanjas
  # POST /hanjas.json
  def create
    @hanja = Hanja.new(hanja_params)

      if @hanja.save
        @hanja.search
        redirect_to new_hanja_url
      else
        render :new
      end
  end

  # PATCH/PUT /hanjas/1
  # PATCH/PUT /hanjas/1.json
  def update
      if @hanja.update(hanja_params)
        redirect_to @hanja, notice: 'Hanja was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /hanjas/1
  # DELETE /hanjas/1.json
  def destroy
    @hanja.destroy
    redirect_to hanjas_url, notice: 'Hanja was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hanja
      @hanja = Hanja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hanja_params
      params.require(:hanja).permit(:name)
    end
end
