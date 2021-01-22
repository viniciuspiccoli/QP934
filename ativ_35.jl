  include("../CELULA_LIGADA/funcoes_otm.jl")
  
  # box, cutoff and side of the system
  box = point_gen(12,1000)
  cutoff = 3
  side = 12

  # for push method
  cls=f(box,cutoff)

  #linked list parameters
 # Nc = trunc(Int64 ,side / cutoff)  # Number of cells
 # N  = length(box)                          # Number of particles 

 # first_atom = zeros(Int64, Nc, Nc) # stating linked lists 
 # next_atom  = zeros(Int64, N)      # next atoms 

  using BenchmarkTools 

  print("Performance of the push method") ;@btime assign_data($box,$side,$cutoff) 
  print("My push method") ;@btime assign($cls)
  print("Performance of the linked lisrt method") ;@btime linkedlist!($box,$side,$cutoff) # , $first_atom,$next_atom)  


