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
    anio_inicio=params[:anio_inicio]
    mes_inicio=params[:mes_inicio]
    if mes_inicio.size==1
      mes_inicio="0"+mes_inicio
    end
    dia_inicio=params[:dia_inicio]
    if dia_inicio.size==1
      dia_inicio="0"+dia_inicio
    end

    anio_final=params[:anio_final]
    mes_final=params[:mes_final]
    if mes_final.size==1
      mes_final="0"+mes_final
    end
    dia_final=params[:dia_final]
    if dia_final.size==1
      dia_final="0"+dia_final
    end

    str=" created_at BETWEEN '" + anio_inicio + "-" + mes_inicio + "-" + dia_inicio + "' and '" + anio_final + "-" + mes_final + "-" + dia_final + "'"

		if Ganador.count < Participant.count 
	    participant = nil
			array = Participant.where(str)
			if array.count == 0
				redirect_to ganadors_path, notice: 'No hay participantes disponibles en las fechas escogidas.'
				return
			end
			offset = array.count
  	  begin
  	    participant = array[rand(offset)]
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
		else
			redirect_to ganadors_path, notice: 'No es posible escoger mas ganadores.'
    end
  end

  # PUT /ganadors/1
  # PUT /ganadors/1.json
  def update
    @ganador = Ganador.find(params[:id])
		if @ganador
			@ganador.foto = params[:foto]
	    respond_to do |format|
      	if @ganador.save
      	  format.html { redirect_to @ganador, notice: 'Ganador was successfully updated.' }
      	  format.json { head :no_content }
      	else
      	  format.html { render action: "edit" }
      	  format.json { render json: @ganador.errors, status: :unprocessable_entity }
      	end
    	end
		else
			redirect_to ganadors_path, notice: 'Tal ganador no existe.'
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

  def ganadores
    render "ganadores"
  end
  def legal
    render "legal"
  end
end
