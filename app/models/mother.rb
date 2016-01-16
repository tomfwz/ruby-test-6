class Mother < Person
  enumerize :gender, in: [:female]

  MIN_AGE = 18

  def say_something
    "Hello, I am your mother."
  end
end
