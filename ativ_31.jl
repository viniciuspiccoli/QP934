include("funcoes_otm.jl")

import Random 

 # Box 
 function point_gen(range::Int64, N::Int64)
   Random.seed!(321)
   pts = [range*rand(2) for i in 1:N]  
   return pts
 end

 function cutoff_pairs(box,e,sig,cutoff;side=10)
   Ut = 0.
   d  = +Inf
   for i in 1:length(box)
     for j in i+1:length(box)
       d = pbcseparation(box[i],box[j],side)
       if d <= cutoff
         Ut  = Ut +  lj(d,e,sig) 
       end   
     end
   end
   return Ut	
 end

# box with 10000 particles with coordinates ranging from 0 to 100

 box = point_gen(100,10000);  
 cutoff = 2.
 e = 2.
 sig = 0.5

 A = cutoff_pairs(box,e,sig,cutoff)
 println(A)


