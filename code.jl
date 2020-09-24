  using Plots, DelimitedFiles
  function gen_data(x)
    a1 = 2x*rand(x) 
    a2 = rand(x) * 0.5
    return a1,a2
  end
  x,y = gen_data(80)
  plot(xlabel="asdasda", ylabel="asdasdas")
  plot!(x,y)
  savefig("./teste.png")
