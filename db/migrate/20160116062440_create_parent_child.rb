class CreateParentChild < ActiveRecord::Migration
  def change
    create_table :parent_child do |t|
      t.integer :children_id
      t.integer :father_id
      t.integer :mother_id
    end
  end
end
