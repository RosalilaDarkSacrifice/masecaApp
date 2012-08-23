class GanadorsController < ApplicationController
  # GET /ganadors
  # GET /ganadors.json
  def index
    @ganadors = Ganador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ganadors }
    end
  end

  # GET /ganadors/1
  # GET /ganadors/1.json
  def show
    @ganador = Ganador.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ganador }
    end
  end

  # GET /ganadors/new
  # GET /ganadors/new.json
  def new
    @ganador = Ganador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ganador }
    end
  end

  # GET /ganadors/1/edit
  def edit
    @ganador = Ganador.find(params[:id])
  end

  # POST /ganadors
  # POST /ganadors.json
  def create
    participant = nil
    begin
      participant = Participant.offset(rand(Participant.count)).first
    end while participant.ganador_flag

		participant.ganador_flag = true
    participant.save
    @ganador = Ganador.new
    @ganador.id_participante = participant.id

    respond_to do |format|
      if @ganador.save
        format.html { redirect_to @ganador, notice: 'Ganador was successfully created.' }
        format.json { render json: @ganador, status: :created, location: @ganador }
      else
        format.html { render action: "new" }
        format.json { render json: @ganador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ganadors/1
  # PUT /ganadors/1.json
  def update
    @ganador = Ganador.find(params[:id])

    respond_to do |format|
      if @ganador.update_attributes(params[:ganador])
        format.html { redirect_to @ganador, notice: 'Ganador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ganador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ganadors/1
  # DELETE /ganadors/1.json
  def destroy
    @ganador = Ganador.find(params[:id])
    @ganador.destroy

    respond_to do |format|
      format.html { redirect_to ganadors_url }
      format.json { head :no_content }
    end
  end
end
