class CreateSolves < ActiveRecord::Migration[6.1]
  def change
    create_table :solves do |t|
      t.string :n
      t.string :a

      t.timestamps
    end
  end
end
