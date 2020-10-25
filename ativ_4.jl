# exercício 4
  function f(x::Vector)
    x[1] = x[1] + 1
    return x
  end

  function g(x::Vector)
    y = copy(x)
    y[1] = y[1] + 1
    return y
  end
  
# funcao 1
  x = [1,1]   
  f(x)
  println(x)

# funcao 2
  y = [1,1]
  g(y)
  println(y)



###########


# exercício 5

  x = [2,2]
  y = copy(x) 

  y[1]  = y[1] - 5

  println(x)
  println(y) 


      
# exercício 6

  x = [i for i in 1:10]
  y = Vector{Int64}(undef,length(x))

  println(x)

  for i in 1:length(x)
    y[i] = x[i]
  end

  y[1] = y[1] - 19  
  y[6] = y[6] + 5 
 
  
  println(x) 
  println(y)
    


