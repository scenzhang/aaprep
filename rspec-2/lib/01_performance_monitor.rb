def measure(n = 1, &proc)
  runtimes = []
  n.times do
    before = Time.now
    proc.call
    runtimes << Time.now - before
  end
  runtimes.reduce(&:+) / runtimes.length
end
