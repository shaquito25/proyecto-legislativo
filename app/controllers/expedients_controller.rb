class ExpedientsController < ApplicationController
  include ApplicationHelper
  before_action :set_expedient, only: %i[ show edit update destroy ]
  before_action :check_administrator_permission

  # GET /expedients or /expedients.json
  def index
    @expedients = Expedient.all
  end

  # GET /expedients/1 or /expedients/1.json
  def show
  end

  # GET /expedients/new
  def new
    @expedient = Expedient.new
  end

  # GET /expedients/1/edit
  def edit
  end

  # POST /expedients or /expedients.json
  def create
    @expedient = Expedient.new(expedient_params)
    @expedient.perfil_id = current_user.id
    respond_to do |format|
      if @expedient.save
        format.html { redirect_to expedient_url(@expedient), notice: "Expedient was successfully created." }
        format.json { render :show, status: :created, location: @expedient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expedient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expedients/1 or /expedients/1.json
  def update
    respond_to do |format|
      if @expedient.update(expedient_params)
        format.html { redirect_to expedient_url(@expedient), notice: "Expedient was successfully updated." }
        format.json { render :show, status: :ok, location: @expedient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expedient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expedients/1 or /expedients/1.json
  def destroy
    @expedient.destroy

    respond_to do |format|
      format.html { redirect_to expedients_url, notice: "Expedient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expedient
      @expedient = Expedient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expedient_params
      params.require(:expedient).permit(:name, :surname, :person_type, :age, :birth_date, :request_quantity, :document, :email, :perfil_id)
    end
end
