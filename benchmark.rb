def matrix_fib(num)
  if num == 1
    [0,1]
  else
    f = matrix_fib(num/2)
    c = f[0] * f[0] + f[1] * f[1]
    d = f[1] * (f[1] + 2 * f[0])
    num.even? ? [c,d] : [d,c+d]
  end
end

def fib_matrix(num)
  num.zero? ? num : matrix_fib(num)[1]
end

Benchmark.bmbm(10) do |x|
  x.report("matrix:" )    {  fib_matrix(1000)       }
end
