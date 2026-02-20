class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps

      # Adding the admin reference, pointing to the users table
      t.references :admin, foreign_key: { to_table: :users }
    end
  end
end
