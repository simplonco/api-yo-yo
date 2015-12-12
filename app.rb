require 'sinatra'
require 'json'
require './lib/stepper'
set :bind, '0.0.0.0'
set :environment, :production
set :port, 80
set :level, 0

def query
  params.map{|key, value| "#{key}=#{value}"}.join("&")
end

get '/turn' do
  content_type :json

  begin
    if params[:direction] == 'up' && settings.level.zero?
      fail('Impossible to go further')
    elsif params[:direction] == 'down'
      settings.level += 1
    else params[:direction] == 'up'
      settings.level -= 1
    end

    puts "Level: #{settings.level}"
    Stepper.turn(step: params[:step], direction: params[:direction], speed: params[:speed])
    {status: true, message: 'success'}.to_json
  rescue Exception => e
  	message = e.message
  	{status: false, message: message}.to_json
  end
end

get '/up' do
  params[:direction] = :up
  redirect "/turn?#{query}"
end

get '/down' do
  params[:direction] = :down
  redirect "/turn?#{query}"
end
