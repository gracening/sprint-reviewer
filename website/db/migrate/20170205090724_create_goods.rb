class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods, :id => false do |t|
      t.integer :id
      t.string :author
      t.string :date
      t.string :body
      t.string :team

      t.timestamps
    end
  end
end
