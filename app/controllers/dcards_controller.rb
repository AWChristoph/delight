class DcardsController < ApplicationController
  before_action :set_dcard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /dcards
  # GET /dcards.json
  def index
    @dcards = Dcard.all
  end

  # GET /dcards/1
  # GET /dcards/1.json
  def show
  end

  # GET /dcards/new
  def new
    @dcard = current_user.dcards.build
  end

  # GET /dcards/1/edit
  def edit
  end

  # POST /dcards
  # POST /dcards.json
  def create
    @dcard = current_user.dcards.build(dcard_params)

    respond_to do |format|
      if @dcard.save
        format.html { redirect_to @dcard, notice: 'Dcard was successfully created.' }
        format.json { render :show, status: :created, location: @dcard }
      else
        format.html { render :new }
        format.json { render json: @dcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dcards/1
  # PATCH/PUT /dcards/1.json
  def update
    respond_to do |format|
      if @dcard.update(dcard_params)
        format.html { redirect_to @dcard, notice: 'Dcard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dcard }
      else
        format.html { render :edit }
        format.json { render json: @dcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dcards/1
  # DELETE /dcards/1.json
  def destroy
    @dcard.destroy
    respond_to do |format|
      format.html { redirect_to dcards_url, notice: 'Dcard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dcard
      @dcard = Dcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dcard_params
      params.require(:dcard).permit(:description)
    end
end
