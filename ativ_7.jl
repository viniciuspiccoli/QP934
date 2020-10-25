# exercise 7
# ep = 100 J / sig = 3.4 angs - Arg wikipédia

  function lj(d::Float64,ep, sig)
    LJ = 4 * ep * ((sig/d)^12 - (sig/d)^6)
    return LJ
  end
