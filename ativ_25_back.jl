  include("./funcoes_otm.jl")
  using BenchmarkTools 
   
  # function - ijcell
  ijcell(pair, cutoff) = [trunc(Int64,pair[1]/cutoff) + 1 , trunc(Int64, pair[2]/cutoff) + 1]


  # function - class
  function class(pts, cutoff, side)
    ncellsx = trunc(Int64,side/cutoff) + 1 # we are going to start from 1 
    ncellsy = trunc(Int64,side/cutoff) + 1 

    list    = zeros()
    for i in 1:length(p)
      push!(,i)

    end

  end


#  function cells(p,cutoff,side)
#    ncells_x = trunc(Int64,side/cutoff) + 1
#    ncells_y = trunc(Int64,side/cutoff) + 1
#    celllist = zeros()
#    for i in 1:length(p)
#       
#    end
#    return celllist
#  end


#### test
  function f(vec;cutoff=3.) 
    cls = Vector{Vector{Int64}}(undef,length(vec)) 
    for i in 1:length(vec)
      x = ijcell(vec[i],cutoff)
      cls[i] = x
    end   
    return cls
  end 

  box = point_gen(12, 50000)
  #each index is the number of a specific particle
  print("SAving in a vector ") ;@btime f($box)

  #A = f(box)


## saving data in a dictionary
  function f2(vec;cutoff=3.) 
    A  = Dict{Int64,Vector{Int64}}()
    for i in 1:length(vec)
      x = ijcell(vec[i],cutoff)
      A[i] = x
    end   
    return A
  end 


  # A[i] where i is the particle identification. The result  corresponds to the particle location ( i.e, the box - [1,3], [2,4], etc.).
  print("Saving in a Dict "); @btime f2($box)
  #A = f2(box)

#    
#### Manipulations using the Dict
#
## Accessing all the Keys 
## using 'keys' keyword 
#Keys = keys(A) 
#println("Keys = ", Keys) 
#  
## Accessing all the Values 
## using 'values' keyword 
#Values = values(A) 
#println("Values = ", Values)
#
#
## getting the box of particle 17
##println(get(A,17,0)) # if the index "17" is not found, the get function returns 0
#SET = get(A,17,0)
#
## getting other particles inside the same box of particle 17
#for i in 1:length(A)
#  va =  get(A,i,0) 
#  if  va == SET  
#    println(i)
#  end
#end








### test of execution
  
#  N  = collect(100:50:5000);
#  
#  for i in N
#  
#    box = point_gen(12,i)
#    print("Time of exec with $i particles = "); @btime f($box)
#
#  end  


