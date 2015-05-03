class CreateDcards < ActiveRecord::Migration
  def change
    create_table :dcards do |t|
      t.belongs_to :user, index: true
      t.belongs_to :presents, index: true
      t.string :description
      t.timestamps null: false
    end

    create_table :presents do |t|
      t.string :description
      t.timestamps null: false

    create_table :user do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
