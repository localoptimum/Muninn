#
# This simple little piece of code lauches a sandman calculation on the GPU.
# Customise line 17 to point at whatever code simulates your system.
# This code assumes that the parameters are passed as a list of arguments
# to the program that is called by "cmd".
# The program must return a float or int representing a relative measure
# of the simulated performance.

require 'matrix'

def launchSandman(vec)

  # convert pars vector into args string chain
  args = vec.to_a()
  
  args = args.join(" ")
  
  cmd = "~/Code/gpu/sandman-inst/build/tasFocus/tasFocus"

  fullcmd = cmd + " " + args # put cmd infront of args

  # Run the program and catch the whole output.  The output
  # is handled back in the main code.  Anything other than a
  # number is dumped as an error message before exit is called.
  response = IO.popen(fullcmd) { |io|
    io.read.chomp
  }

end

