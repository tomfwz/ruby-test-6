class CreatePersons < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string  :first_name
      t.string  :last_name
      t.date    :dob
      t.string  :gender
      t.string  :type
      
      t.timestamps
    end
  end
end
