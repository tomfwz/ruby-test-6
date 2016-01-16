class Person < ActiveRecord::Base
  extend Enumerize

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :dob,        presence: true

  enumerize :type,   in: [:father, :mother, :son, :daughter]

  def age
    ((Date.today - dob) / 365).floor
  end
end
