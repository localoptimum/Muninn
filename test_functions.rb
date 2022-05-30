require "matrix"

def rosenbrock_test(pars)
  #Rosenbrock's curved valley ("banana")

  ca=1.0
  cb=100.0

  if(!pars.is_a?(Vector))
    puts("Error: non-vector passed as paramter to rosenbrock test function.")
    exit(1)
  end

  if(pars.size() < 2)
    puts("ERROR: too few parameters passed to rosenbrock test function.")
    exit(1)
  end
  
  xval = pars[0]
  yval = pars[1]

  term1 = cb * (yval - xval*xval) * (yval - xval*xval)
  term2 = (ca - xval) * (ca - xval)
  
  answer = term1 + term2
end




def wood_test(pars)
    #Wood's function of 4 parameters

    if(!pars.is_a?(Vector))
      puts("Error: non-vector passed as paramter to wood test function.")
      exit(1)
    end

    if(pars.size() < 6)
      puts("ERROR: too few parameters passed to wood test function.")
      exit(1)
    end

    wval = pars[0]
    xval = pars[1]
    yval = pars[2]
    zval = pars[3]
    
    term1 = 100*(xval - wval*wval)*(xval - wval*wval)
    term2 = (wval-1)*(wval-1)
    term3 = 90*(zval-yval*yval)*(zval-yval*yval)
    term4 = (1-yval)*(1-yval)
    term5 = 10.1*( (xval-1)*(xval-1) + (zval-1)*(zval-1) )
    term6 = 19.8*(xval-1)*(zval-1)
    
    answer = term1 + term2 + term3 + term4 + term5 + term6
    return(answer)
end






def powell_test(pars)
  #powell's function of 4 parameters
  	
  if(!pars.is_a?(Vector))
    puts("Error: non-vector passed as paramter to powell test function.")
    exit(1)
  end
  
  if(pars.size() < 6)
    puts("ERROR: too few parameters passed to powell test function.")
    exit(1)
  end

  wval = pars[0]
  xval = pars[1]
  yval = pars[2]
  zval = pars[3]
  
  term1 = (wval+10*xval)*(wval+10*xval);
  term2 = 5*(xval-2*yval)*5*(xval-2*yval);
  term3 = (xval-2*yval)*(xval-2*yval)*(xval-2*yval)*(xval-2*yval);
  term4 = 10*(wval-zval)*(wval-zval)*(wval-zval)*(wval-zval);
  
  answer = term1 + term2 + term3 + term4;
  return(answer);
end
