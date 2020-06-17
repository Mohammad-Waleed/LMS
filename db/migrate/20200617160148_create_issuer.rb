class CreateIssuer < ActiveRecord::Migration[5.2]
  def change
    create_table :issuers do |t|
      t.string :fname ,null: false
      t.string :lname ,null: false
      t.integer :balance ,null: false ,default: 0
      t.integer :status ,null: false,default: 0
    end
  end
end
