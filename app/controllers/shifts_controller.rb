class ShiftsController < ApplicationController
  before_action :set_user, only: %i[ show end_shift start_shift index]

  # GET /shifts or /shifts.json
  def index
    @shifts = Shift.by_user(@user).all
  end

  # GET /shifts/1 or /shifts/1.json
  #def show
  #end

  # GET /shifts/start
  def start_shift
    @user.start_shift
  end

  # GET /shifts/end
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
