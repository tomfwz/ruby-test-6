class Person < ActiveRecord::Base
  extend Enumerize

  belongs_to :father, class_name: 'Person', foreign_key: 'father_id'
  belongs_to :mother, class_name: 'Person', foreign_key: 'mother_id'

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :dob,        presence: true

  enumerize :type,   in: [:Father, :Mother, :Son, :Daughter]

  def age
    ((Date.today - dob) / 365).floor
  end

  def parent
    [mother, father]
  end
end
