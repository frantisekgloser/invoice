module MathUtils
  def self.factorial(n)
    raise ArgumentError.new('Factorial of negative numbers is not defined') \
      if n < 0

    n > 1 ? n*factorial(n-1) : 1
  end
end
