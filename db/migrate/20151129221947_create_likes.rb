class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :value

      t.timestamps null: false
    end

    add_reference :likes, :user, index: true, foreign_key: true
    add_reference :likes, :idea, index: true, foreign_key: true
    add_reference :ideas, :user, index: true, foreign_key: true
  end
end
