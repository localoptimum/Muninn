require "matrix"

require_relative './sandmanLauncher.rb'

#for testing purposes
require_relative './test_functions.rb'


class Particle
  @@fitness = nil
  @@bestpos = nil
  @@inertial_constant = 0.95
  @@local_weight = 0.5
  @@collective_weight = 0.5
    
    
  def initialize
    @lolimit = nil
    @hilimit = nil
    @position = nil
    @fitness = nil # initialise with no defined fitness
    @bestfit = nil
    @bestpos = nil
  end


  
  def seed(position)
    # Check that the passed argument is an vector
    if (!position.is_a?(Vector))
      puts("ERROR: attempt to assign particle position with non-vector type.")
      exit(1)
    end
    
    # Check that all elements in the vector are numeric
    if(!position.is_a?(Integer) && !position.is_a?(Float))
      position.each {|p|
        if (!(p.is_a?(Integer) || p.is_a?(Float)))
          puts("ERROR: attempt to assign particle position with non-numeric vector element.")
          puts(position)
          exit(1)
        end
      }
    end
    
    # If we get here, we are good to seed
    @position = position
    self.evaluate()
  end

  
  def setlolimit(position)
    
    # Check that the passed argument is an vector
    if (!position.is_a?(Vector))
      puts("ERROR: attempt to assign particle lo limit with non-vector type.")
      exit(1)
    end
    
    # Check that all elements in the vector are numeric
    if(!position.is_a?(Integer) && !position.is_a?(Float))
      position.each {|p|
        if (!(p.is_a?(Integer) || p.is_a?(Float)))
          puts("ERROR: attempt to assign particle lo limit with non-numeric vector element.")
          puts(position)
          exit(1)
        end
      }
    end
    
    # If we get here, we are good to set
    @lolimit = position
  end


  
  def sethilimit(position)
    
    # Check that the passed argument is an vector
    if (!position.is_a?(Vector))
      puts("ERROR: attempt to assign particle hi limit with non-vector type.")
      exit(1)
    end
    
    # Check that all elements in the vector are numeric
    if(!position.is_a?(Integer) && !position.is_a?(Float))
      position.each {|p|
        if (!(p.is_a?(Integer) || p.is_a?(Float)))
          puts("ERROR: attempt to assign particle hi limit with non-numeric vector element.")
          puts(position)
          exit(1)
        end
      }
    end
    
    # If we get here, we are good to set
    @hilimit = position
  end

  def randomize()
    if(@lolimit.nil?)
      puts("ERROR: trying to randomize a particle before setting lo limits.")
      exit(1)
    end

    if(@hilimit.nil?)
      puts("ERROR: trying to randomize a particle before setting hi limits.")
      exit(1)
    end

    if(@lolimit.size() != @hilimit.size())
      puts("ERROR: unequal limit length, cannot determine spatial dimensions.")
      exit(1)
    end

    # if we get here, all is good.  Randomize.

    zeros = Array.new(@lolimit.size(),0.0)
    
    @position = Vector.elements(zeros, true)
    
    @position.to_a().each_index do |i|
      @position[i] = rand(@lolimit[i]..@hilimit[i])
    end

    @velocity = Vector.elements(zeros, true)
    
    @velocity.to_a().each_index do |i|
      @velocity[i] = rand(-(@hilimit[i] - @lolimit[i])/2 .. (@hilimit[i] - @lolimit[i])/2)
    end

    # Finally, evaluate the position 
    self.evaluate()
    
  end
  
    
  def evaluate()

    @response = rosenbrock_test(@position)

    # neutron optics simulation
    #@response = launchSandman(@position)    
    # explicitly convert this into a number
    # This optimiser is a minimiser, so make flux negative
    #@response = -@response.to_f()
   
    if (@response.is_a?(Integer) || @response.is_a?(Float))
      @fitness = @response
    else
      puts("ERROR: Non-numeric evaluation result for particle.")
      puts(self.inspect)
      puts("Result obtained:")
      puts(@response)
      exit(1)
    end

    
    # if this result is better than our fitness, update our fitness
    if(@bestfit != nil)
      if(@response < @bestfit)
        @bestfit = @response
        @bestpos = @position
      end
    else
      @bestfit = @response
      @bestpos = @position
    end 
    
    # if this result is better than any particle fitness, update that too
    if(@@fitness != nil)
      if(@response < @@fitness)
        @@fitness = @response
        @@bestpos = @position
        self.reportImprovement()
      end
    else      
      @@fitness = @response
      @@bestpos = @position
      self.reportImprovement()
    end
  end

  def reportImprovement()
      puts("Global improvement:")
      puts("   " + @response.to_s())
      puts("   " + @position.to_s())
  end

  
  def move()
    @position = @position + @velocity

    #if we hit the limits, move the position to the edge of the limit zone

    @position.to_a().each_index { |i|
      if @position[i] > @hilimit[i]
        @position[i] = @hilimit[i]
      end

      if @position[i] < @lolimit[i]
        @position[i] = @lolimit[i]
      end
    }
    # Evaluate new position
    self.evaluate()
  end

  def accelerate()
    # Two pseudo-random weighting factors
    r1 = rand(0.0..1.0)
    r2 = rand(0.0..1.0)

    # Damped acceleration towards the two points
    @velocity = @@inertial_constant * @velocity + @@local_weight * r1 * (@bestpos - @position) + @@collective_weight * r2 * (@@bestpos - @position)
    
  end

  def globalPos()
    @@bestpos
  end

  def globalFitness()
    @@fitness
  end
  
  attr_reader :position, :fitness
end


