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
    @datos_1 = @data_service.characters_10
    @datos_2 = @data_service.characters_20
    @datos_3 = @data_service.characters_30
    @datos_4 = @data_service.characters_40
    @datos_5 = @data_service.characters_50
    @datos_6 = @data_service.characters_60
    @datos_7 = @data_service.characters_70
    @quotes = @data_service.quotes
    @name = params[:character_name]
    @frases = []

    (0..@datos_1.length()-1).each do |i|
        if (not @datos_1[i]['name'].nil?) and (@datos_1[i]['name'] == @name)
            @personaje = @datos_1[i]
        end
    end 
    (0..@datos_2.length()-1).each do |i|
        if (not @datos_2[i]['name'].nil?) and (@datos_2[i]['name'] == @name)
            @personaje = @datos_2[i]
        end
    end 
    (0..@datos_3.length()-1).each do |i|
        if (not @datos_3[i]['name'].nil?) and (@datos_3[i]['name'] == @name)
            @personaje = @datos_3[i]
        end
    end 
    (0..@datos_4.length()-1).each do |i|
        if (not @datos_4[i]['name'].nil?) and (@datos_4[i]['name'] == @name)
            @personaje = @datos_4[i]
        end
    end 
    (0..@datos_5.length()-1).each do |i|
        if (not @datos_5[i]['name'].nil?) and (@datos_5[i]['name'] == @name)
            @personaje = @datos_5[i]
        end
    end 
    (0..@datos_6.length()-1).each do |i|
        if (not @datos_6[i]['name'].nil?) and (@datos_6[i]['name'] == @name)
            @personaje = @datos_6[i]
        end
    end 

    (0..@datos_7.length()-1).each do |i|
        if (not @datos_7[i]['name'].nil?) and (@datos_7[i]['name'] == @name)
            @personaje = @datos_7[i]
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
    @busqueda = params[:datos]["search"]
    @nuevo = DataSummary.new(@busqueda)
    @resultado_final = @nuevo.search
end

private

def set_data_service
    @data_service = DataSummary.new("Vacio")
end

end

