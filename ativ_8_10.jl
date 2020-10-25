include("./ativ_7.jl")

# exercise 8, 9 and 10
 cls  = ["red", "green", "blue", "pink", "orange", "black"] # Plot colors
 eps  = [80, 100, 120, 140, 160, 200]                       # Well depth . Reference value: 120 e(J)/kb(J/K) = K
 sigs = [ 0.34, 0.36, 0.38, 0.40, 0.42, 0.44]               # sigma values in nm. Reference value is 0.34 nm 
 dist = [i for i in 0.32:0.01:0.85]                         # Distance ranging from 0.32 to 0.85 nm

 using Plots, LaTeXStrings
 
 plot(framestyle=:box, legend=:best, grid=:false)
 plot!(xlabel=L"r\ / \mathrm{\AA}",ylabel=L"Energy\ of\ interaction\ ", ylims=[-130, 350]) 

 for i in 1:length(eps)
   energies = lj.(dist,eps[3],sigs[i])
   plot!(dist, energies, label=sigs[i], linewidth=2, color=cls[i])
 end

 annotate!( 0.70, 100, text("Ar-Ar ep=120", :center, 10))
 plot!(size=(375,375))
 savefig("LJ_Ar_potential.png") 
