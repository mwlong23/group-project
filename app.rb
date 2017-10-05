require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require ('./lib/meetup')
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

get('/new_meetup')do
  @user = User.find(session[:id])
  erb(:new_meetup)
end

post('/new_meetup') do

  @user = User.find(session[:id])
  meetup = Meetup.new(name: params['name'], catagory: params['category'], zip: params['zip'],day_time: params['date'], street: params['street'], city: params['city'], state: params['state'], description: params['desc'])
  meetup.save

  redirect(:'/users/home')
end

get('users/user_profile')do
  @user = User.find(session[:id])
  erb(:user_profile)
end

get('/')do
  erb(:register)
end

get('/tech')do
@user = User.find(session[:id])
@meetups = Meetup.all
binding.pry
  erb(:tech)
end

get('/cooking')do
@user = User.find(session[:id])
@meetups = Meetup.all
  erb(:cooking)
end

get('/outdoors')do
@user = User.find(session[:id])
  @meetups = Meetup.all
  erb(:outdoors)
end

get('/gaming')do
@user = User.find(session[:id])
@meetups = Meetup.all
  erb(:gaming)
end

post('/signup') do
  @user = User.find(session[:id])
 @meet_up = Meetup.find(params["meetup_id"])
 if (!@meet_up.users.include? @user)
     @meet_up.users.push(@user)
 end
 redirect back
end

get('/about')do
  erb(:about)
end

get('/')do
  erb(:meetup)
end
