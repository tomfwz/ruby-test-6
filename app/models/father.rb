class Father < Person
  enumerize :gender, in: [:male]

  MIN_AGE = 20

  def say_something
    "Hello, I am your father."
  end
end
