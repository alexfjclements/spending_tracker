require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require('date')
require_relative( './models/label.rb' )
require_relative('./models/merchant.rb')
require_relative('./models/transaction.rb')
require_relative('./models/user.rb')
require_relative('controllers/labels_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/users_controller')


also_reload( './models/*' )

get '/' do
  # Hard coding user id as not implementing log-in system
  @user = User.find(1)
  @transactions = Transaction.all
  @transactions_present = Transaction.present
  erb(:"/index")
end
