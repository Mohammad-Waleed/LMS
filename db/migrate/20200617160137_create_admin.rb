class CreateAdmin < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.references :library_id
    end
  end
end
