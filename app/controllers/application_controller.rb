require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :team
    end

    post '/teams' do
        p params
        @team = Team.new(params[:team][:name], params[:team][:motto])

        params[:team][:members].each do |member|
            Hero.new(member)
        end

        @members = Hero.all
        erb :super_hero
    end
end
