class Mother < Person
  enumerize :gender, in: [:female]

  def say_something
    "Hello, I am your mother."
  end
end
