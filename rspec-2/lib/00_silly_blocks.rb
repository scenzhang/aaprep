def reverser(&prc)
  strs = prc.call
  strs = strs.split(" ")
  strs.map(&:reverse).join(" ")
end

def adder(val=1, &prc)
  prc.call + val
end

def repeater(n = 1, &prc)
  n.times { prc.call }
end
