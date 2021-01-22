# exercise 28

  # using push
  function assign(data)
    pts = maximum(data)   
    M   = [ Int[] for i in 1:pts[1], j in 1:pts[2] ] # Array to save particles in a cell 
    N   = zeros(Int64,pts[1],pts[1])  # Array to save the number of particles in each cell

    # saving the particles that are inside of the same cell
    for i in 1:length(data)
      var = data[i]
      push!(M[var[1],var[2]],i)     
    end
    
    # couting the number of particles in each cell
    for i in 1:pts[1], j in 1:pts[2]
      N[i,j] = count(i->(i!=0), M[i,j])
    end

    return M, N
  end 
    
    
  # using pre-allocated vectors
  function assign_vec(data)
    pts = maximum(data)
    
    M = zeros(Int64, pts[1], pts[2],20) # 10 is the maximum number of positions for each cell
    N = zeros(Int64, pts[1], pts[2])
            
    for i in 1:length(data)
      icell = data[i][1]  
      jcell = data[i][2]
      N[icell,jcell] = N[icell,jcell] + 1
      M[icell,jcell,N[icell, jcell]] = i
    end

    return M, N
  end


# testing 
 using BenchmarkTools
 include("./ativ_25.jl")

 # assign_vec alt
 pts = maximum(cls)
   
 list  = zeros(Int64, pts[1], pts[2],20) # 10 is the maximum number of positions for each cell
 nlist = zeros(Int64, pts[1], pts[2])

 function assign_vec!(data,M,N)
           
   for i in 1:length(data)
     icell = data[i][1]  
     jcell = data[i][2]
     N[icell,jcell] = N[icell,jcell] + 1
     M[icell,jcell,N[icell, jcell]] = i
   end
                                                                                             
   return M, N
 end

 println("Bechmarks")
 print("execution time (push)  = ") ; @btime assign($cls) 
 print("execution time (alloc)  = "); @btime assign_vec($cls) 
 print("execution time (alloc2) = "); @btime assign_vec!($cls,list,nlist) setup=(list=zeros(Int64, pts[1], pts[2],20); nlist=zeros(Int64, pts[1], pts[2]))  evals=1

