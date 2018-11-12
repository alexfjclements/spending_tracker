require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( './models/label.rb' )
require_relative('./models/merchant.rb')
require_relative('./models/transaction.rb')
require_relative('controllers/labels_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')


also_reload( './models/*' )
