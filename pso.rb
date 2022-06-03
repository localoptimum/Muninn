#!/usr/bin/ruby

require_relative './swarm.rb'

# Test of rosenbrock function optimisation
# Should converge at 1,1 with a=1, b=100
lolims=Vector[-2.0,-2.0]
hilims=Vector[2.0,2.0]

# More complex optimisation of a real world neutron optics problem
#lolims = Vector[0.01,-1.0,1.0, 0.02,0.02,1.0, 0.02,0.02,1.0]
#hilims = Vector[0.04,-0.05,6.0, 0.1,0.1,5.0, 0.15,0.15,4.0]

# Seed one solution using parameter estimates
#seedpos = Vector[0.0181968443954311, -0.6, 5.4085324838403155, 0.02678955617348458, 0.0304464630931984, 3.1428663973295636, 0.15, 0.15, 1.5378723889923598]

swm = Swarm.new(lolims, hilims)#, seedpos)
