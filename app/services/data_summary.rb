class DataSummary
    include HTTParty
    base_uri 'https://tarea-1-breaking-bad.herokuapp.com/api'

    def initialize(busqueda)
        @busqueda = busqueda
        @options = {}
    end

    def characters
        self.class.get('/characters?limit=10&offset='+ @busqueda, @options)
    end

    # def characters_10
    #     self.class.get('/characters', @options)
    # end

    # def characters_20
    #     self.class.get('/characters?limit=10&offset=10', @options)
    # end
    # def characters_30
    #     self.class.get('/characters?limit=10&offset=20', @options)
    # end
    # def characters_40
    #     self.class.get('/characters?limit=10&offset=30', @options)
    # end
    # def characters_50
    #     self.class.get('/characters?limit=10&offset=40', @options)
    # end
    # def characters_60
    #     self.class.get('/characters?limit=10&offset=50', @options)
    # end
    # def characters_70
    #     self.class.get('/characters?limit=10&offset=60', @options)
    # end

    def episodes
        self.class.get('/episodes', @options)
    end

    def quotes
        self.class.get('/quotes', @options)
    end

    def search
        self.class.get('/characters?name=' + @busqueda, @options)
    end



end




