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


## Why Ruby?

Multiple early versions of this PSO code were written in C++ and
Mathematica.  I rewrote it in Ruby because:

* The search algorithm itself doesn't need to run on-the-metal fast.
  The speed bottleneck is the external monte-carlo evaluation, and
  since I plan to do that on a single nvidia GPU the search algorithm
  can also be single thread.
* If I need to multi-thread Ruby it will take me hardly any time and
  it's a couple of lines of code.
* Scripting languages are simpler for rapid geometry testing and
  checking, because you don't need to keep compiling all the time.
* I like ruby a hell of a lot more than I like python (yuck).
* I wanted a simpler interface to launching the GPU code than I had.
  

# References

1. [(Kennedy, Eberhart) Original PSO paper](https://doi.org/10.1109%2FICNN.1995.488968)
2. [(me and Andersen) PSO applied to focussing Neutron
   Optics](https://doi.org/10.1107/S0021889809003483)
3. [(Beecham et al) PSO used to design a magnetic
   field](https://doi.org/10.1016/j.physb.2010.11.054)
4. [Di Julio et al) PSO used on more complex optics and compared to other
   algorithms](https://doi.org/10.1088/1742-6596/528/1/012006)
5. [(me, with some help from Filges) PSO used to design the ESS
   layout](https://doi.org/10.1088/2399-6528/ab8782)
