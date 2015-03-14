class DcardsController < ApplicationController
  before_action :set_dcard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @dcards = Dcard.all
  end

  def show
  end

  def new
    @dcard = current_user.dcards.build
  end

  def edit
  end

  def create
    @dcard = current_user.dcards.build(dcard_params)
    if @dcard.save
      redirect_to @dcard, notice: 'Dcard was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @dcard.update(dcard_params)
      redirect_to @dcard, notice: 'Dcard was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @dcard.destroy
    redirect_to dcards_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dcard
      @dcard = Dcard.find_by(id: params[:id])
    end

    def correct_user
      @dcard = current_user.dcards.find_by(id: params[:id])
      redirect_to dcards_path, notice: "Not authorized to edit this DCard" if @dcard.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dcard_params
      params.require(:dcard).permit(:description, :image)
    end
end