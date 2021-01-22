# exercise 26
  include("ativ_25.jl")

  box   = point_gen(12,50) # 50 points with coordinates from 0 to 12
  cells = f(box)           # vector that relates particle with its cell


  # function to classify
  function assign(data)
    pts = maximum(data)   
    M   = [ [] for i in 1:pts[1], j in 1:pts[2] ] # Array to save particles in a cell 
    N   = zeros(Int64,pts[1],pts[1])  # Array to save the number of particles in each cell

    # saving the particles that are inside of the same cell
    for i in 1:length(data)
      var = data[i]
      push!(M[var[1],var[2]],i)     
    end
    
    # couting the number of particles in each cell
    for i in 1:pts[1], j in 1:pts[2]
      N[i,j] = count(i->(i!=0), M[i,j])
    end

   return M, N

  end 


  pts, ns =  assign(cells)
