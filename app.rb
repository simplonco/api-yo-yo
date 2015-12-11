require 'sinatra'
require 'json'
require './lib/stepper'

def query
  params.map{|key, value| "#{key}=#{value}"}.join("&")
end

get '/turn' do
  content_type :json

  begin
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