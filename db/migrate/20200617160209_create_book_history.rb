class CreateBookHistory < ActiveRecord::Migration[5.2]
  def change
    create_table :book_histories do |t|
      t.references :book_id      ,null: false
      t.references :issuer_id    ,null: false
      t.string :start_date    ,null: false
      t.string :end_date      ,null: false
    end
  end
end
