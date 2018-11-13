get '/settings' do
  # Hard coding user id as not implementing log-in system
  @user = User.find(1)
  erb(:"/users/settings")
end

post '/settings' do
  # Hard coding user id as not implementing log-in system
  params.merge!("id" => 1)
  user = User.new(params)
  user.update
  redirect to "/settings"
end
