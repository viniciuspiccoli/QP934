  # exercise 29

  include("./funcoes_otm.jl")

  box = point_gen(15,50) 
  cls = f(box)

  N = length(box);

  # creating vectors
  pts = maximum(cls) # max number of i and j 
  list  = zeros(Int64, pts[1], pts[2],N) # 20 - maximum number of cell positions
  nlist = zeros(Int64, pts[1], pts[2])

  # function to save particles in each cell
  function assign!(data, M, N) 
    for i in 1:length(data) 
      icell = data[i][1]
      jcell = data[i][2]
      N[icell,jcell] = N[icell,jcell] + 1
      M[icell,jcell,N[icell, jcell]] = i 
    end
  end

  

  function mindist(p,cellparticles,cutoff)
    np = length(p) # Number of particles
    nc = size(cellparticles,1) # Dimension of the grid
    d = +Inf
    U = 0
    for ip in 1:np
      icell = trunc(Int64,p[ip][1]/cutoff)+1
      jcell = trunc(Int64,p[ip][2]/cutoff)+1
      for i in icell-1:icell+1
        if ( i < 1 || i > nc ) continue end # Border
        for j in jcell-1:jcell+1
          if ( j < 1 || j > nc ) continue end # Border
          # Loop over the particles of this cell
          for jp in cellparticles[i,j,:]
            if jp > ip # Skip repeated
              # Compute distance and keep minimum
              d = min(d,sqrt( (p[ip][1]-p[jp][1])^2 + (p[ip][2]-p[jp][2])^2) )
              U = U + lj(d,5,2)
            end
          end
        end
      end
    end
    return U
  end


  # using push
  function assign(data)
    pts = maximum(data)   
    M   = [ Int[] for i in 1:pts[1], j in 1:pts[2] ] 
    N   = zeros(Int64,pts[1],pts[1]) 

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
 
 
 function mindist2(p,cellparticles,cutoff)
   np = length(p) # Number of particles
   nc = size(cellparticles,1) # Dimension of the grid
   d = +Inf
   U = 0
   for ip in 1:np
     icell = trunc(Int64,p[ip][1]/cutoff)+1
     jcell = trunc(Int64,p[ip][2]/cutoff)+1
     for i in icell-1:icell+1
       if ( i < 1 || i > nc ) continue end # Border
       for j in jcell-1:jcell+1
         if ( j < 1 || j > nc ) continue end # Border
         # Loop over the particles of this cell
         for jp in cellparticles[i,j]
           if jp > ip # Skip repeated
             # Compute distance and keep minimum
             d = min(d,sqrt( (p[ip][1]-p[jp][1])^2 + (p[ip][2]-p[jp][2])^2) )
             U = U + lj(d,5,2)
           end
         end
       end
     end
   end
   return U
 end

 using BenchmarkTools
 pts = maximum(cls)

#print("assign alloc")#; @btime assign!($cls,list,nlist) setup=(list=zeros(Int64, pts[1], pts[2],N); nlist=zeros(Int64, pts[1], pts[2]))  evals=1
;
#print("assign push")#; @btime  assign($cls)   
      

#print("TIme of ex for alloc = ")#; @btime mindist($box,$list,3.)
#print("Time of ex for push  = ")#; @btime mindist2($box,$plist,3.)


assign!(cls,list,nlist) ;
plist, pnlist = assign(cls) ; 

U  = mindist(box,list,3.)
println(U)
U2 = mindist2(box,plist,3.)
println(U2) 

# exercise 30









