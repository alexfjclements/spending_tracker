
get '/labels' do
  @labels = Label.all()
  erb ( :"labels/addrm" )
end
