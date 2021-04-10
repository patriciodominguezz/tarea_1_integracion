class HomesController < ApplicationController
    before_action :set_data_service

def index
    @search = Home.new
    datos = @data_service.episodes
    breaking_bad = []
    better_caul_saul = []
    (0.. datos.length()-1).each do |i|
        if datos[i]['series'] == "Breaking Bad"
            temporada = datos[i]["season"]
            breaking_bad.append(temporada)
        else
            temporada = datos[i]["season"]
            better_caul_saul.append(temporada)
        end
    end
   @breaking_bad_seasons = breaking_bad.uniq
   @better_caul_saul_seasons = better_caul_saul.uniq

end

def breaking_bad_seasons
    @search = Home.new
    datos = @data_service.episodes
    @id = params[:id] 
    @episodios = []
    (0.. datos.length()-1).each do |i|
        if (datos[i]['series'] == "Breaking Bad") and (datos[i]['season'] == @id)
            nombre = datos[i]["title"]
            numero = datos[i]["episode"]
            @episodios.append([numero,nombre])
        end
    end
end
def better_call_saul_seasons
    @search = Home.new
    datos = @data_service.episodes
    @id = params[:id] 
    @episodios = []
    (0.. datos.length()-1).each do |i|
        if (datos[i]['series'] == "Better Call Saul") and (datos[i]['season'] == @id)
            nombre = datos[i]["title"]
            numero = datos[i]["episode"]
            @episodios.append([numero,nombre])
        end
    end
end

def breaking_bad_episodes
    @search = Home.new
    datos = @data_service.episodes
    @name = params[:name]
    (0.. datos.length()-1).each do |i|
        if (datos[i]['series'] == "Breaking Bad") and (datos[i]['title'] == @name)
            @episodio = datos[i]
        end
    end
    @air_date = @episodio["air_date"].to_str
end 

def better_call_saul_episodes
    @search = Home.new
    datos = @data_service.episodes
    @name = params[:name]
    (0.. datos.length()-1).each do |i|
        if (datos[i]['series'] == "Better Call Saul") and (datos[i]['title'] == @name)
            @episodio = datos[i]
        end
    end
    @air_date = @episodio["air_date"].to_str
end 

def characters
     @search = Home.new
     cantidad = 0
     @quotes = @data_service.quotes
     @name = params[:character_name]
     @frases = []

     while true
        @nuevo = DataSummary.new(cantidad.to_s)
        @datos = @nuevo.characters
        (0..@datos.length()-1).each do |i|
            if (not @datos[i]['name'].nil?) and (@datos[i]['name'] == @name)
                @personaje = @datos[i]
                break
            end
        end
        if !@personaje.nil?
            break
        else
        cantidad += 10 
        end
    end

     (0.. @quotes.length()-1).each do |i|
        if (@quotes[i]['author'] == @name)
            @frases.append([@quotes[i]["quote"],@quotes[i]["series"]])
        end
     end
end

def search_characters
    @busqueda = params.require(:home).permit(:search)

    redirect_to view_character_path(datos: @busqueda)

end

def view_characters
    @search = Home.new
    @busqueda = params[:datos]["search"]
    @mayuscula = @busqueda.capitalize
    #@nuevo_1 = DataSummary.new(@busqueda)
    #@resultado_final = @nuevo.search
    cantidad = 0
    @personajes = []
    while true
        @nuevo_2 = DataSummary.new(cantidad.to_s)
        @datos = @nuevo_2.characters
        (0..@datos.length()-1).each do |i|
            if (not @datos[i]['name'].nil?) and (@datos[i]['name'].include? @mayuscula)
                @personajes.append(@datos[i]['name'])
            end
        end
        if (@datos.length() < 10)
            break
        else
        cantidad += 10 
        end
    end
end

private

def set_data_service
    @data_service = DataSummary.new("Vacio")
end

end

