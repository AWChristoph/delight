class CreateDcards < ActiveRecord::Migration
  def change
    create_table :dcards do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
