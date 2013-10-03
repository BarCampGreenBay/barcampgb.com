class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :twitter
      t.string :shirt_size
      t.text :diet_concerns

      t.timestamps
    end
  end
end
