
# functions
  function lj(d::Float64,ep, sig)
    LJ = 4 * ep * ((sig/d)^12 - (sig/d)^6)
    return LJ
  end

  function dist(x::Vector{Float64},y::Vector{Float64})
    d = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
    return d
  end

# exercício 11 

# parte 1  

 # LJ potential 
 sig = 1.  
 ep  = 10. 

 # Plot
 dists = [i for i in 0.86:0.01:6]
 energies = lj.(dists,ep,sig)
 using Plots, LaTeXStrings 
 plot(framestyle=:box, legend=:best, grid=:false, ylims=[-12.5,20])
 plot!(xlabel=L"\textrm{Distance}",ylabel=L"\textrm{Energy of interaction} ") 
 plot!(dist, energies, label=L"\textrm{LJ Potential}", linewidth=2, color="blue")
 #annotate!( 0.70, 200, text("ep=100, sig=0.34", :center, 10))                                                                                            
 plot!(size=(375,375))
 savefig("LJ_potential.png") 

# parte 2

  box = [10*rand(2) for i in 1:10]
  # box[point][coordinates]

  # function to sum LJ energy for all pairs of atoms in a box
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
 
  println(U)
  println(n)
