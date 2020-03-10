class Hero
    attr_reader :name, :power, :bio

    @@all = []

    def self.all
        @@all
    end

    def initialize(params)
        @name = params[:name]
        @power = params[:power]
        @bio = params[:bio]
        @@all << self
    end

end