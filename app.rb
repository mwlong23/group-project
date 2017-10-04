require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/user")
require("./lib/login")
require('./lib/profile')
require("pg")
require("email_validator")

require("pry")

enable :sessions

get('/')do
  erb(:'users/index')
end

get('/sessions/login')do
  erb(:'sessions/login')
end
post '/sessions' do
  @user = User.find_by(email: params["email"], password: params["password"])
  session[:id] = @user.id
  # binding.pry
  redirect "/users/home"
end

get('/registrations/signup')do
  erb(:'registrations/signup')
end

post('/registrations/signup')do
  @user = User.new(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
  # binding.pry
  if @user.save() && @user.password == params['password_confirm'] && @user.email == params['email_confirm']
    session[:id] = @user.id
    # redirect "/users/#{@user.id}/home"
    redirect "/users/update_profile"
  else
    redirect "/registrations/signup"
  end
end

get('/users/update_profile') do
  # binding.pry
  @user = User.find(session[:id])
  erb (:'users/update_profile')
end

post('/profile') do
  @user = User.find(session[:id])
  @profile = Profile.create(user_id: @user.id, birthday: params['birthday'], gender: params['gender'], zip: params['zip'], bio: params['bio'], photo: params['fileToUpload'])
  redirect(:'/users/home')
end
get '/users/home' do
  @user = User.find(session[:id])
  erb(:'/users/index')
end

get('/sessions/logout')do
    session.clear
  erb(:'users/index')
end

get('')do
  erb(:subjects)
end

get('')do
  erb(:subject_detail)
end

get('')do
  erb(:register)
end
