# exercise 15 and 16

# function that will create a box with side equal to "range" and "N" points.
  function point_gen(range::Int64, N::Int64)
    pts = [range*rand(2) for i in 1:N]  
    return pts
  end

 function  pbcseparation(ds,L)
   if ds > 0.5*L
     ds = ds - L
   elseif ds < -0.5*L
     ds = ds + L
   end
   return ds
 end


#function r(x::Vector{Float64},y::Vector{Float64},side)
#  # dx is a vector of the difference in position of y and x
#  dx = y - x
#  for i in 1:2
#    dx[i] = dx[i]%side
#    if dx[i] > side/2
#      dx[i] = dx[i] - side
#    elseif dx[i] < -side/2
#      dx[i] = dx[i] + side
#    end
#  end
#  return sqrt(dx[1]^2+dx[2]^2)
#end




# Function to calculate the distance between two points  
 function pbcseparation2(x::Vector{Float64},y::Vector{Float64}, L::Int64)
   ds = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2) % L
   for i in 1:length(y)
     if ds > 0.5*L
       y[i] = y[i] - L 
     elseif ds < -0.5*L
       y[i] = y[i] + L
     end 
   end
   dn = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
   return dn
 end


# function pbcseparation(x::Vector{Float64},y::Vector{Float64}, L::Int64)   
#   ds = y - x
#   for i in 1:2
#     ds[i] = ds[i]%L    
#     if ds[i] > 0.5*L
#       ds[i] = ds[i] - L 
#     elseif ds[i] < -0.5*L
#       ds[i] = ds[i] + L
#     end 
#   end
#   dn = sqrt((ds[1])^2 + (ds[2])^2)
#   return dn
# end
 

  function dist(x::Vector{Float64},y::Vector{Float64})
    d = sqrt((y[1] - x[1])^2 + (y[2]-x[2])^2)
    return d
  end

 
# # creating two points
# pts = point_gen(100,2)
# # calculation of the distance between the two points 
# n_dista = dist(pts[1],pts[2])
# # calculation of the distance acoording to the minimal-image
# distance = pbcseparation(pts[1],pts[2],10) 
#
# println("Distance between two points = ",n_dista)
# println("Distance between two points according to the minimal-distance convention = ",distance)



# exercise 17
let

 box = point_gen(100,100)
 dists = Vector{Float64}(undef, (length(box)-1) * length(box))
  
 n = 0
 for i in 1:length(box)-1
   for j in i+1:length(box)
     n = n + 1
     #println("Pair : $i - $j")
     dn = dist(box[i],box[j])
     
     dx = pbcseparation(box[i][1]-box[j][1],5)
     dy = pbcseparation(box[i][2]-box[j][2],5)

     d = sqrt(dx*dx + dy*dy)
     d2 = pbcseparation2(box[i],box[j],5)
     dists[n] = d     
     println(" Distance    = ",dn)
     println(" Distance MI = ",d) 
     println(" Distance MI2 = ", d2)

   end    
 end  

# println(maximum(dists)) 


end
#exercise 18


