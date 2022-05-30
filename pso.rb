#!/usr/bin/ruby

require_relative './swarm.rb'

# Test of rosenbrock function optimisation
# Should converge at 1,1 with a=1, b=100
lolims=Vector[-2.0,-2.0]
hilims=Vector[2.0,2.0]


swm = Swarm.new(lolims, hilims)
