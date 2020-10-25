# exercise 17

include("./ativ_16.jl")

let

  box      = point_gen(100,100)
  pbc_side = 10 
  dists    = Vector{Float64}(undef, (length(box)-1) * length(box))
  dist2    = Vector{Float64}(undef, (length(box)-1) * length(box))

 
  n = 0
  for i in 1:length(box)-1
    for j in i+1:length(box)
      n = n + 1
      dists[n] = r(box[i],box[j], pbc_side)
      dist2[n] = pbc(box[i],box[j], pbc_side) 
    end    
  end  
 
  d_max = maximum(dists)
  d_max2= maximum(dist2) 
  d_pbc = sqrt(pbc_side^2 + pbc_side^2) / 2  
  
  println("Max distance found: $d_max")
  println("Max distance found2: $d_max2")
  println("Max distance possible: $d_pbc")
  
end
