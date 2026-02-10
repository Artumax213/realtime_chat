class ChangeContactsAddPolymorphicType < ActiveRecord::Migration[8.0]
  def change
    # remove the existing contact_id column
    remove_column :contacts, :contact_id, :bigint

    # add polymorphic references for contactable for both users and groups
    add_reference :contacts, :contactable, polymorphic: true, index: true

    # add a unique index to enforce uniqueness of user-contactable pairs
    add_index :contacts, [ :user_id, :contactable_id, :contactable_type ], unique: true, name: "index_contacts_on_user_and_contactable"
  end
end
