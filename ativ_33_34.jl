  include("../CELULA_LIGADA/funcoes_otm.jl")
   
  box = point_gen(12,10)
  cutoff = 3
  side = 12

  Nc = trunc(Int64 ,side / cutoff)  # Number of cells
  N  = length(box)                          # Number of particles 

  # stating linked lists
  first_atom = zeros(Int64, Nc, Nc)
  
  #first_atom = [ Int64[] for i in 1:Nc, j in 1:Nc ]
  next_atom  = zeros(Int64, N) 


#  for iat in 1:N
#    
#    icell = trunc(Int64, box[iat][1]/cutoff) + 1     
#    jcell = trunc(Int64, box[iat][2]/cutoff) + 1
#  
#    next_atom[iat] = first_atom[icell, jcell] 
#
#    first_atom[icell, jcell] = iat
#        
#    
#  end


  # function
  function linkedlist!(box, side, cutoff, first_atom, next_atom)
 
    for iat in 1:N
    
      icell = trunc(Int64, box[iat][1]/cutoff) + 1     
      jcell = trunc(Int64, box[iat][2]/cutoff) + 1

      next_atom[iat] = first_atom[icell, jcell] 
                                                        
      first_atom[icell, jcell] = iat
        
    end
  end

  linkedlist!(box,side,cutoff,first_atom, next_atom)
