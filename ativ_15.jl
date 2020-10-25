# exercise 15
let
  # box
  pts = [100*rand(2) for i in 1:2] 

  # distance between two potins occording to the minimal-image convention
  ds = sqrt((pts[1][1] - pts[2][1])^2 + (pts[1][2]-pts[2][2])^2) % 10.
  for i in 1:2
    if ds > 0.5*10
      pts[2][i] = pts[2][i] - 10 
    elseif ds < -0.5*10
      pts[2][i] = pts[2][i] + 10
    end 
  end
  dn = sqrt((pts[2][1] - pts[1][1])^2 + (pts[2][2]-pts[1][2])^2)

 println(dn)

end


