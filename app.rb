require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/label.rb' )
require_relative('controllers/labels_controller')

also_reload( '../models/*' )
