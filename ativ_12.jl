
  using BenchmarkTools

# functions
  function lj(d::Float64,ep::Float64, sig::Float64)
    LJ = 4 * ep * ((sig/d)^12 - (sig/d)^6)
    return LJ
  end

  function dist(x::Vector{Float64},y::Vector{Float64})
    d = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
    return d
  end

# new function pot + dist - optm

  function lj2(x::Vector{Float64},y::Vector{Float64},eps4::Float64, sig6::Float64,sig12::Float64)
    d = (y[1] - x[1])^2 + (y[2]-x[2])^2
    r6  = d^3
    r12 = r6^2    
    LJ = eps4 * ((sig12/r12) - (sig6/r6))
    return LJ
  end

 # exercise 12 

 # Func 1 
 function box_LJ(box::Vector, sig::Float64, ep::Float64)
   Ut = 0. # energia total
   n  = 0 # número total de pares não repetidos
   for i in 1:length(box)-1
     for j in i+1:length(box)
       n = n + 1
       d = dist(box[i],box[j])
       U = lj(d,ep,sig)
       Ut = Ut + U
     end 
   end
   return Ut
 end

 # Func 2
 function box_LJ2(box::Vector, sig::Float64, ep::Float64)
   Ut = 0 
   N = length(box) 
   eps4  = 4*ep    
   sig6  = sig^6
   sig12 = sig6^2 
  
   for i in 1:N-1
     for j in i+1:N      
       U = lj2(box[i],box[j],eps4,sig6,sig12) 
       Ut = Ut + U       
     end
   end
  
   return Ut 
 end

 using BenchmarkTools, Test
 # LJ potential 
 sig = 1.  
 ep  = 10. 
                                  
 box = [10*rand(2) for i in 1:10]

 @test isapprox(box_LJ(box,sig,ep), box_LJ2(box,sig,ep)) 
 print("LJ 1"); @btime box_LJ($box,$sig,$ep)
 print("LJ 2 - otimizado"); @btime box_LJ2($box,$sig,$ep)
