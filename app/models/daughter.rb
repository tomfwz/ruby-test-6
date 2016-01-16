class Daughter < Person
  enumerize :gender, in: [:female]

  def say_something
    "Hello, I am your daughter."
  end
end
