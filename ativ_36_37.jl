# exercise 36
function energy(box,cutoff, first_atom, next_atom,ep,sig,side)

  vec = [length(first_atom[:,1]), length(first_atom[1,:])]          # vector with maximum dimensions
  N   = length(box)                                                   # number of atoms
  #d   = +Inf
  Ut  = 0.

  for iat in 1:N
    icell = trunc(Int64,box[iat][1]/cutoff) + 1
    jcell = trunc(Int64,box[iat][2]/cutoff) + 1
    
    for i in icell-1:icell+1
      for j in jcell-1:jcell+1
        iw, jw = wrap_cell(vec,i, j) 
        jat = first_atom[iw,jw]
     
        while jat > 0
  
          # Compute distance and keep minimum
          #d = min(d,sqrt( (box[iat][1]-box[jat][1])^2 + (box[iat][2]-box[jat][2])^2) )
          #d = (box[iat][1]-box[jat][1])^2 + (box[iat][2]-box[jat][2])^2                 
          d = pbcseparation(box[iat], box[jat],side)

          #if d==0
          # println("fdp")
          # println(iat, "  ", jat)
          #end         
 
          if jat > iat
            Ut = Ut + U(d,ep,sig)
          end
          jat = next_atom[jat]
          
        end
      end
    end
  end
  
  return Ut 
end

function energy(box,cutoff,ep,sig,side)

  first_atom, next_atom = linkedlist(box, side, cutoff)  

  vec = [length(first_atom[:,1]), length(first_atom[1,:])]          # vector with maximum dimensions
  N   = length(box)                                                   # number of atoms
  #d   = +Inf
  Ut  = 0.

  for iat in 1:N
    icell = trunc(Int64,box[iat][1]/cutoff) + 1
    jcell = trunc(Int64,box[iat][2]/cutoff) + 1
    
    for i in icell-1:icell+1
      for j in jcell-1:jcell+1
        iw, jw = wrap_cell(vec,i, j) 
        jat = first_atom[iw,jw]
     
        while jat > 0
  
          # Compute distance and keep minimum
          #d = min(d,sqrt( (box[iat][1]-box[jat][1])^2 + (box[iat][2]-box[jat][2])^2) )
          #d = (box[iat][1]-box[jat][1])^2 + (box[iat][2]-box[jat][2])^2                 
          
          #if d==0
          # println("fdp")
          # println(iat, "  ", jat)
          #end         
 
          if jat > iat
            d = pbcseparation(box[iat], box[jat],side)
            Ut = Ut + U(d,ep,sig)
          end
          jat = next_atom[jat]
          
        end
      end
    end
  end
  
  return Ut 
end




# exercise 37
 include("../funcoes_otm.jl")
 include("../initial-point.jl")


 side = 100
 cutoff = 2
 e = 5.0
 sig = 0.5
 box = initial_point(10_000,side,0.9)
 

# import Random
# Random.seed!(321)
# box = [ 100*rand(2) for i in 1:10_000 ]
#
# side = 100  
# cutoff = 10.
# e = 2.
# sig = 0.5


 using BenchmarkTools, Test

# println("Bechmarks for the lists gen")
# print("Time to create lists using linkedlists method") ;@btime linkedlist($box,$side, $cutoff) 
# print("Time to create a matrix using push method")     ;@btime assign_data($box, $side, $cutoff)  



 fatm, natm = linkedlist(box,side, cutoff) 
 list2 = assign_data(box, side, cutoff) # linked cells direct 

  N   = 10000 # number of molecules
  vec = [length(fatm[:,1]), length(fatm[1,:])] # maximum number of cells


#print("naive method") ; @btime cutoff_pairs($box,$e,$sig,$cutoff,$side)
#Uz = cutoff_pairs(box,e,sig,cutoff,side)
#println(Uz)
#println("  ")
#
#print("Linked cells method") ;@btime pot_ener($box,$list2,$cutoff,$e,$sig,$side)
#Ut = pot_ener(box,list2,cutoff,e,sig,side)
#println(Ut)
#println("   ")

print("Linked lists method") ;@btime energy($box,$cutoff, $fatm, $natm,$e,$sig,$side)
U1=energy(box,cutoff, fatm, natm,e,sig,side,vec,N)  #,N,vec
println(U1)
#println("  ")

#print("Linked listsi (2) method") ;@btime energy($box,$cutoff,$e,$sig,$side)
#U2=energy(box,cutoff,e,sig,side)
#println(U2)
#println("  ")
