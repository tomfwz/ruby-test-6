class Father < Person
  enumerize :gender, in: [:male]

  def say_somthing
    "Hello, I am your father."
  end
end
