require 'socket'
require './lib/stepper'

server = TCPServer.open(2000)
loop do
  client = server.accept
  params = client.read(100).strip.split(',').collect(&:strip)

  direction = params[0].to_sym
  step = params[1].to_i
  speed = params[2].to_i

  puts "Direction: #{direction}, Step: #{step}, Speed: #{speed}"

  Stepper.turn direction: direction, step: step, speed: speed
  client.close
end