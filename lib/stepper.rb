require 'arduino_firmata'

class Stepper
 
  ARDUINO = ArduinoFirmata.connect '/dev/tty.wchusbserialfd120'

  PIN_STEP = 9
  PIN_DIR = 8

  ARDUINO.digital_write PIN_DIR, true
  ARDUINO.digital_write PIN_STEP, false

  def self.turn(opts = {})
    step = Integer(opts[:step] || 100)
    direction = opts[:direction] || :up
    speed = Integer(opts[:speed] || 75)
    # Convert speed to pause time
    time = (100 - speed) / 1000.0

    if direction == :down
      ARDUINO.digital_write PIN_DIR, false
    else direction
      ARDUINO.digital_write PIN_DIR, true
    end

    step.times do |n|
      ARDUINO.digital_write PIN_STEP, true
      sleep time
      ARDUINO.digital_write PIN_STEP, false
      sleep time
    end
  end
end