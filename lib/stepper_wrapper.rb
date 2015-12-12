class StepperWrapper
  HOSTNAME_SERVER = 'localhost'
  PORT_SERVER = 2000

  def self.turn(opts = {})
  	step = Integer(opts[:step] || 100)
    direction = opts[:direction] || :down
    speed = Integer(opts[:speed] || 75)

  	socket = TCPSocket.open(HOSTNAME_SERVER, PORT_SERVER)
	socket.write("#{direction}, #{step}, #{speed}\n");
	socket.close
  end
end