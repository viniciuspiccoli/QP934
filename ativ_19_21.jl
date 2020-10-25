# exercise 19 -  21

# functions
 
# function that will create a box with side equal to "range" and "N" points.
 function point_gen(range::Int64, N::Int64)
   pts = [range*rand(2) for i in 1:N]  
   return pts
 end

# function to calculate the distance between two points according to the minimal-distance convention 
 function pbcseparation(x::Vector{Float64},y::Vector{Float64}, L::Int64)
   for i in 1:2
     ds = (y[i] - x[i])%L    
     if ds > 0.5*L
       y[i] = y[i] - L 
     elseif ds < -0.5*L
       y[i] = y[i] + L
     end 
   end
   dn = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
   return dn
 end
  
# Calculation of the distance between two points
 function dist(x::Vector{Float64},y::Vector{Float64})
   d = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
   return d
 end

# Lennard-Jones potential 
 function lj(d::Float64,ep, sig)
   LJ = 4 * ep * ((sig/d)^12 - (sig/d)^6)
   return LJ
 end
 
###############################################################################

# first program - calculating the LJ pot of all pairs
function all_pairs(box,e,sig)
 side = 10
 Ut = 0. 
 for i in 1:length(box)
   for j in i+1:length(box)
     U = lj(pbcseparation(box[i],box[j],side),e,sig) 
     Ut = Ut + U   
   end
 end
 return Ut	
end
 
# Program that calculates the LJ pot only if the distance between particles is smaller than the cutoff.
function cutoff_pairs(box,e,sig,cutoff)
 side = 10 
 Ut = 0. 
 for i in 1:length(box)
   for j in i+1:length(box)
     d  = pbcseparation(box[i],box[j],side)
     if d <= cutoff
       Ut  += lj(d,e,sig) 
     end   
   end
 end
 return Ut	
end


# box with 100 points with coordinates ranging from 0 to 10

 box = point_gen(10,100);  
 cutoff = 2.
 e = 2.
 sig = 0.5

 using BenchmarkTools, Test
 @test all_pairs(box,e,sig) ≈ cutoff_pairs(box,e,sig,cutoff)

 print("All pairs ");        @btime    all_pairs($box,$e,$sig)   
 print("Cutoff pairs ");     @btime    cutoff_pairs($box,$e,$sig,$cutoff)

# println("result all pairs            = ", all_pairs(box,e,sig))
# println("result with cutoff          = ", cutoff_pairs(box,e,sig,cutoff))

