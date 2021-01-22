  include("./funcoes_otm.jl")
  using BenchmarkTools 
 

  ### exercise 25

  # function - ijcell
  ijcell(pair, cutoff) = [trunc(Int64,pair[1]/cutoff) + 1 , trunc(Int64, pair[2]/cutoff) + 1]


#  # function - class
#  function class(pts, cutoff, side)
#    ncellsx = trunc(Int64,side/cutoff) + 1 # we are going to start from 1 
#    ncellsy = trunc(Int64,side/cutoff) + 1 
#
#    list    = zeros()
#    for i in 1:length(p)
#      push!(,i)
#
#    end
#
#  end
# test of execution
#  N  = collect(100:50:5000);
#  
#  for i in N
#  
#    box = point_gen(12,i)
#    print("Time of exec with $i particles = "); @btime f($box)
#
#  end  


  function f(vec;cutoff=3.) 
    cls = Vector{Vector{Int64}}(undef,length(vec)) 
    for i in 1:length(vec)
      x = ijcell(vec[i],cutoff)
      cls[i] = x
    end   
    return cls
  end 

  box = point_gen(12, 10000) 
  cls = f(box)

#  println(cls)  

