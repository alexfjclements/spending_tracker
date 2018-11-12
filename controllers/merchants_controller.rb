get '/merchants' do
  @merchants = Merchant.all()
  erb ( :"merchants/addrm" )
end

post '/merchants' do
  # Hard coding user id as not implementing log-in system
  params.merge!("user_id" => 1)
  merchant = Merchant.new(params)
  merchant.save
  redirect to "/merchants"
end

post '/merchants/delete' do
  merchant = Merchant.find(params["merchant_id"])
  merchant.delete
  redirect to "/merchants"
end
