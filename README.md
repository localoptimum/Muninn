# Muninn


## What is it?

Particle Swarm Optimisation (PSO) in Ruby.


## Why PSO?

PSO is powerful, efficient, and basically better than humans, when it
comes to designing complex devices in non-linear, noisy parameter
spaces.  This same algorithm, with the same parameters, has been used
by me for various projects over many years (see refs [2-5] below).

Famous alternatives to PSO include:

* Simulated annealing 
* Genetic algorithms
* Differential evolution
* Artificial bee colony

PSO is really easy to code, understand, and work with.

## Like, how easy?

pso.rb is an executable script, like a bash script.  It points to 
#!/usr/bin/ruby on my machine, check that on your installation and then 
you can just do:
```
./pso.rb
```
and it will run your optimisation job.  There are a few preparation steps.

### Step 1
You need to customise pso.rb to create the two vectors containing 
the parameter space limits (one vector of low values, one vector
of high values.  pso.rb then just creates a swarm.

### Step 2
Customise swarm.rb if you want to change the swarm size or the
number of iterations (probably not necessary really).

### Step 3
Customize the "evaluate()" function in particle.rb, to call whatever
simulation you want to optimise.  An example is used that will
run a [sandman](https://github.com/localoptimum/sandman) raytracing simulation on the gpu.
You could just as easily use sandmanLauncher.rb as a template to
call a vitess pipe, assemble PHITS or MCNP inputs, or run mcstas, geant4 etc.


## Why Ruby?

Early versions of this PSO code were written in C++ and
Mathematica for problems I was working on at the time.  
I rewrote it in Ruby recently because:

* I wanted a simpler interface to launching the GPU code than I had for a new neutron optics optimisation project
* Since starting using [metasploit](https://www.metasploit.com) a few months back, I have been encouraging myself to turn to Ruby as much as I can for software problems so I'm more familiar with it.
* I like ruby a hell of a lot more than I like python (yuck).
* The search algorithm itself doesn't need to run on-the-metal fast.
  The speed bottleneck is the external monte-carlo evaluation, and
  since I plan to do that on a single nvidia GPU the search algorithm
  can also be single thread.
* If I need to multi-thread Ruby it will take me hardly any time and
  it's a couple of lines of code.
* Scripting languages are simpler for rapid geometry testing and
  checking, because you don't need to keep compiling all the time.
  

# References

1. [(Kennedy, Eberhart) Original PSO paper](https://doi.org/10.1109%2FICNN.1995.488968)
2. [Me and Andersen: PSO applied to focussing Neutron
   Optics](https://doi.org/10.1107/S0021889809003483)
3. [Beecham et al: PSO used to design a magnetic
   field](https://doi.org/10.1016/j.physb.2010.11.054)
4. [Di Julio et al: PSO used on more complex optics and compared to other
   algorithms](https://doi.org/10.1088/1742-6596/528/1/012006)
5. [Me, with some simulation help and knowledge from Filges: PSO used to design layout of the ESS](https://doi.org/10.1088/2399-6528/ab8782).  You can see in that paper the instruments are largely [placed in the same locations as appears now](https://europeanspallationsource.se/instruments) (there were some minor changes) 
