# exercise 16

# function that will create a box with side equal to "range" and "N" points within.
  function point_gen(range::Int64, N::Int64)
    pts = [range*rand(2) for i in 1:N]  
    return pts
  end

# Function to calculate the distance between two points  
 function pbc(x::Vector{Float64},y::Vector{Float64}, L)
   ds = y - x 
   for i in 1:2
     ds[i] = ds[i]%L
     if ds[i] > 0.5*L
       ds[i] = ds[i] - L 
     elseif ds[i] < -0.5*L
       ds[i] = ds[i] + L
     end 
   end
   return sqrt(ds[1]^2 + ds[2]^2)
 end

function r(x::Vector{Float64},y::Vector{Float64}, side)
  # dx is a vector of the difference in position of y and x
  dx = y - x
  for i in 1:2
    dx[i] = dx[i]%side
    if dx[i] > side/2
      dx[i] = dx[i] - side
    elseif  dx[i] < -side/2
      dx[i] = dx[i] + side
    end
  end
  return sqrt(dx[1]^2+dx[2]^2)
end



