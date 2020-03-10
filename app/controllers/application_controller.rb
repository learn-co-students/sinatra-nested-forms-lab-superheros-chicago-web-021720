require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get('/') {
        erb :super_hero
    }

    post('/teams') {
        @team = Team.new(params[:team])
        params[:team][:members].each { |info| Hero.new(info) }
        @heroes = Hero.all
        erb :team
    }

end
