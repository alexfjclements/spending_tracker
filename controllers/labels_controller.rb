
get '/labels' do
  @labels = Label.all()
  erb ( :"labels/addrm" )
end

post '/labels' do
  # Hard coding user id as not implementing log-in system
  params.merge!("user_id" => 1)
  label = Label.new(params)
  label.save
  redirect to "/labels"
end
