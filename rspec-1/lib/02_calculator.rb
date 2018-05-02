def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  arr.reduce(0, :+)
end

def multiply(a, b, *rest)
  p = a * b
  rest.reduce(p, :*)
end

def pow(a, b)
  a ** b
end

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n-1)
  end
end
