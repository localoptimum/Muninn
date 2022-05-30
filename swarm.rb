require "matrix"

require_relative './particle.rb'

class Swarm    

  def initialize(lolims, hilims)

    @nparticles = 30
    @niterations = 300

    
    if(!lolims.is_a?(Vector) || !hilims.is_a?(Vector))
      puts("ERROR: non-vector object passed as limits")
      exit(1)
    end

    if(!lolims[0].is_a?(Integer) && !lolims[0].is_a?(Float))
      puts("ERROR: non-numeric limit given")
      puts(lolims)
      exit(1)
    end

    if(!hilims[0].is_a?(Integer) && !hilims[0].is_a?(Float))
      puts("ERROR: non-numeric limit given")
      puts(lolims)
      exit(1)
    end

    if(hilims.size() != lolims.size())
      puts("ERROR: number of dimensions differs in swarm limits given.")
      exit(1)
    end
    
      
    @particles = Array.new(@nparticles)

    @particles.each_index { |p|
      @particles[p] = Particle.new()
      @particles[p].setlolimit(lolims)
      @particles[p].sethilimit(hilims)
      @particles[p].randomize()
    }
        
    for itr in 1..@niterations do
      @particles.each_index { |p|
        @particles[p].move()
        @particles[p].accelerate() 
      }
      puts("Iteration " + itr.to_s())
    end

    @gbest = @particles[0].globalFitness()
    @gbestpos = @particles[0].globalPos()
    
    puts(@gbest)
    puts(@gbestpos) 
  end
end



