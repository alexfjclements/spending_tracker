require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/label.rb' )
also_reload( '../models/*' )

get '/labels' do
  @labels = Label.all()
  erb ( :"labels/index" )
end
