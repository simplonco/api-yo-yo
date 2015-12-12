require 'arduino_firmata'

class Stepper

  PIN_STEP = 9
  PIN_DIR = 8
  
  @arduino = ArduinoFirmata.connect '/dev/tty.wchusbserialfa130'

  @arduino.digital_write PIN_DIR, true
  @arduino.digital_write PIN_STEP, false

  def self.turn(opts = {})
    step = Integer(opts[:step] || 100)
    direction = opts[:direction] || :down
    speed = Integer(opts[:speed] || 75)
    # Convert speed to pause time
    time = (100 - speed) / 1000.0

    if direction == :down
      @arduino.digital_write PIN_DIR, false
    else direction
      @arduino.digital_write PIN_DIR, true
    end

    step.times do |n|
      @arduino.digital_write PIN_STEP, true
      sleep time
      @arduino.digital_write PIN_STEP, false
      sleep time
    end
  end
end
