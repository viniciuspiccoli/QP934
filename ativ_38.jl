  include("../initial-point.jl")

  #box = (10000,100,0.9)  


  import Random
  Random.seed!(321)
  box = [ 100*rand(2) for i in 1:10_000 ]
 
  side = 100  
  cutoff = 10.
  #e = 2.
  #sig = 0.5

  function celllist1(p,side,cutoff)
    n = round(Int64,side/cutoff)
    cellparticles = [ Int64[] for i in 1:n, j in 1:n ]

    for i in 1:length(p)
      icell = trunc(Int64,p[i][1]/cutoff) + 1
      jcell = trunc(Int64,p[i][2]/cutoff) + 1
      push!(cellparticles[icell,jcell],i)
    end
      return cellparticles
  end
  
  function celllist2(p,side,cutoff,nmax)
    n = round(Int64,side/cutoff)
    nparticles = zeros(Int64,n,n)
    cellparticles = Array{Int64}(undef,n,n,nmax)
    for i in 1:length(p)
      icell = trunc(Int64,p[i][1]/cutoff) + 1
      jcell = trunc(Int64,p[i][2]/cutoff) + 1
      nparticles[icell,jcell] += 1
      if nparticles[icell,jcell] > nmax
        error("n > nmax")
      end
      cellparticles[icell,jcell,nparticles[icell,jcell]] = i
    end
    return cellparticles
  end
   
  function celllist3(box, side, cutoff)  #  , first_atom, next_atom
    Nc = trunc(Int64 ,side / cutoff)  # Number of cells
    N  = length(box)                          # Number of particles
    first_atom = zeros(Int64,Nc, Nc)
    next_atom  = zeros(Int64, N)

    for iat in 1:N
      icell = trunc(Int64, box[iat][1]/cutoff) + 1
      jcell = trunc(Int64, box[iat][2]/cutoff) + 1
      next_atom[iat] = first_atom[icell, jcell]
      first_atom[icell, jcell] = iat
    end

    return first_atom, next_atom
  end

  println("Benchmarks")

  using BenchmarkTools

  print("celllist 1") ;@btime celllist1($box,$side,$cutoff)
  print("celllist 2") ;@btime celllist2($box,$side,$cutoff,10000)
  print("celllist 3") ;@btime celllist3($box,$side,$cutoff)
