# exercise 32
  include("funcoes_otm.jl")

# box with 10000 particles with coordinates ranging from 0 to 100

 box = point_gen(100,10000);  
 side = 100  
 cutoff = 10.

 e = 2.
 sig = 0.5

 cls = f(box,cutoff)
 list = assign(cls);

 list2 = assign_data(box, side, cutoff)

 using BenchmarkTools, Test

 print("Cutoff pairs ");     @btime    cutoff_pairs($box,$e,$sig,$cutoff,$side)
 print("Linked cells");      @btime    pot_ener($box,$list, $cutoff,$e,$sig,$side)  

 A = cutoff_pairs(box,e,sig,cutoff,side)
 println(A)

 B = pot_ener(box,list,cutoff,e,sig,side)
 println(B)


