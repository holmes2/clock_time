class ShiftsController < ApplicationController
  before_action :set_user, only: %i[ show end_shift new index]

  # GET /shifts or /shifts.json
  def index
    @shifts = Shift.by_user(@user).all
  end

  # GET /shifts/1 or /shifts/1.json
  #def show
  #end

  # GET /shifts/new
  def new
    @user.start_shift
  end

  def end_shift
    @user.end_shift
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_user
    @user = User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def shift_params
    params.require(:shift).permit(:user_id)
  end
end
