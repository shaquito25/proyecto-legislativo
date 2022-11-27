class ExpedientsController < ApplicationController
  require 'csv'
  include ApplicationHelper
  before_action :set_expedient, only: %i[ show edit update destroy restar]
  after_action :restar, only: %i[create]

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
    @med = Inventory.sum(:med)
    @ct = Inventory.sum(:ct)
    @expedient = Expedient.new(expedient_params)
    @expedient.perfil_id = current_user.id
    respond_to do |format|
      if @expedient.save
        format.html { redirect_to expedient_url(@expedient), notice: "Solicitud Creada con Éxito" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def restar
    @med = Inventory.sum(:med)
    @ct = Inventory.sum(:ct)
    if params[:expedient][:request_type] == 'Medicina'
      if @med > params[:expedient][:request_quantity].to_i || @med == params[:expedient][:request_quantity].to_i
        Inventory.update!(med: @med - params[:expedient][:request_quantity].to_i)
      end
    else
      if @ct > params[:expedient][:request_quantity].to_i || @ct > params[:expedient][:request_quantity].to_i
        Inventory.update!(ct: @ct - params[:expedient][:request_quantity].to_i)
      end
    end
  end

  def reportes
		#GENERADOR DE CSV INDICADORES GENERALES   
    if Expedient.count > 0
      @archivo_csv = CSV.generate(:encoding => 'windows-1252') do |csv|
          csv  <<  ["Nombre", "Tipo de Persona", "Documento", "Tipo de Solicitud", "Cantidad Solicitada", "Fecha"]
          Expedient.all.each do |indicador, i|
            csv << [indicador.name, indicador.person_type, indicador.document, indicador.request_type, indicador.request_quantity, indicador.created_at.strftime("%d-%m-%Y")]
          end
        end
        send_data @archivo_csv, :filename => "Solicitudes.csv"
    else
      redirect_to root_path
      flash.alert = "No tenemos solicitudes en estos momentos"
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
      format.html { redirect_to expedients_url, notice: "Solicitud Eliminada con Éxito" }
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
      params.require(:expedient).permit(:name, :surname, :person_type,:birth_date, :request_quantity, :document, :perfil_id, :request_type)
    end
end
