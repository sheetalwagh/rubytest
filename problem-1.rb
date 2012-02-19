# basically issue is with we cant add string & number

def make_string(values)
  tmp = ''
  values.each do |v|
    tmp += v.to_s + ','
  end
  return tmp
end

# if above code can be archived using values.join(",")
