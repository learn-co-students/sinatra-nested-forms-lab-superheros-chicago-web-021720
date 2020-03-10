require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        # Render the form view
        erb :super_hero
    end

    post '/teams' do
        # Get rid of useless top-level key
        team_data = params[:team]
    
        # Create the Team
        @team = Team.new(
            name: team_data[:name],
            motto: team_data[:motto]
        )

        # Create the Heroes
        @heroes = team_data[:heroes].map do |hero|
            Hero.new(
                name: hero[:name],
                power: hero[:power],
                bio: hero[:bio]
            )
        end

        # Render the view with the created objects
        erb :team
    end

end
