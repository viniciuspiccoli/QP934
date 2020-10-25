
# functions
  function lj(d::Float64,ep, sig)
    LJ = 4 * ep * ((sig/d)^12 - (sig/d)^6)
    return LJ
  end

  function dist(x::Vector{Float64},y::Vector{Float64})
    d = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
    return d
  end

# exercise 11 

 # LJ potential 
 sig = 1.  
 ep  = 10. 

 box = [10*rand(2) for i in 1:10]
 # box[point][coordinates]

 # function to sum energy for all pairs of atoms in a box
 function box_LJ(box::Vector, sig::Float64, ep::Float64)
   Ut = 0 # energia total
   n  = 0 # número total de pares não repetidos
   for i in 1:length(box)-1
     for j in i+1:length(box)
       n = n + 1
       d = dist(box[i],box[j])
       U = lj(d,ep,sig)
       Ut = Ut + U
     end 
   end
   Ut = Ut / n
   return Ut, n
 end

 U,n = box_LJ(box,sig,ep)
