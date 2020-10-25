include("./ativ_16.jl")

# exercise 18

 function lj(d::Float64,ep, sig)
   LJ = 4 * ep * ((sig/d)^12 - (sig/d)^6)
   return LJ
 end

 box = point_gen(100,100)
 
 for i in 1:length(box)
   for j in i+1:length(box)
     println("Pair : $i - $j")
     dn = dist(box[i],box[j])
     d = pbcseparation(box[i],box[j],10)
     U = lj(d,10,5)
     println(" Distance    = ",dn)
     println(" Distance MI = ",d) 
     println(" Energy of interaction = ",U)
   end    
 end  






