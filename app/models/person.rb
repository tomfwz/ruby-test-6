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

  def sons
    Person.where('father_id = ? OR mother_id = ? AND gender = ?', id, id, :male)
  end

  def child
    Person.where('father_id = ? OR mother_id = ?', id, id)
  end

  def daughters
    Person.where('father_id = ? OR mother_id = ? AND gender = ?', id, id, :female)
  end

  def brothers
    Person.where('father_id = ? OR mother_id = ? AND gender = ?', father, mother, :male).where.not(id: id)
  end
end
