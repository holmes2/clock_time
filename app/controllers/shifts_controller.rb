class ShiftsController < ApplicationController
  before_action :set_user

  # GET /shifts or /shifts.json
  def index
    @shifts = Shift.by_user(@user).all
  end

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/start
  def start_shift
    respond_to do |format|
      if @user.start_shift
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /shifts/end
  def end_shift
    respond_to do |format|
      if @user.end_shift
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /shifts/start_lunch_break
  def start_lunch_break
    respond_to do |format|
      if @user.start_lunch_break
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /shifts/end_lunch_break
  def end_lunch_break
    respond_to do |format|
      if @user.end_lunch_break
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /shifts/start_break
  def start_break
    respond_to do |format|
      if @user.start_break
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /shifts/end_break
  def end_break
    respond_to do |format|
      if @user.end_break
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
