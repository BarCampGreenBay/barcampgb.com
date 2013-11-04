class CreatePresentationsUsers < ActiveRecord::Migration
  def change
    create_table :presentations_users do |t|
      t.references :presentation, index: true
      t.references :user, index: true
    end
  end
end
