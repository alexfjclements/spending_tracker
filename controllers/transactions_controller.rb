get '/transactions' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @labels = Label.all()
  @trans_pres = Transaction.present()
  erb ( :"transactions/addrm" )
end

post '/transactions' do
  # Hard coding user id as not implementing log-in system
  params.merge!("user_id" => 1)
  # Hard coding timestamp for now
  params.merge!("time_stamp" => "09/30/18")
  transaction = Transaction.new(params)
  transaction.save
  redirect to "/transactions"
end

post '/transactions/delete' do
  transaction = Transaction.find(params["transaction_id"])
  transaction.delete
  redirect to "/transactions"
end
