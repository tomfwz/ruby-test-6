class Father < Person
  enumerize :gender, in: [:male]

  def say_something
    "Hello, I am your father."
  end
end
