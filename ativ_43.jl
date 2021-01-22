using simulationQP934, Test


data = Data();
box = initial_point(data);
nc, fatm, natm = linkedlist(box,data);
force_vec = fvec(data)


utotal = force!(box, data, force_vec, fatm, natm, nc)

# test if the force is zero
vecx = 0.
vecy = 0.

for i in 1:length(force_vec)
  vecx = vecx + force_vec[i][1]
  vecy = vecy + force_vec[i][2]
end


@test vecx \approx 0.
@test vecy \approx 0.



