# exercise 30 

function wrap_cell(dms,id,jd)
  i = dms[1]  
  j = dms[2]

  if id < 1
    id = id  + i 
  elseif id > i
    id = id - i
  end
  if jd < 1
    jd = jd + j              
  elseif jd > j
    jd = jd - j            
  end

 return id, jd
end



function check_wrap(nc)
  list = Matrix{Int}(undef,0,4)
  for i in 1:nc[1]
    for j in 1:nc[2]
      for ic in i-1:i+1
        for jc in j-1:j+1
          iw, jw = wrap_cell(nc,ic,jc)
          list = vcat(list,[ic jc iw jw])
        end
      end
    end
  end
  return list
end


nc = [3,3]
list = check_wrap(nc)
for i in 1:length(list)
  println(list[i])
end


