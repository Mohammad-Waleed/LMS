class CreateManager < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.integer :status , null: false ,default: 0
      t.references :library_id
    end
  end
end
