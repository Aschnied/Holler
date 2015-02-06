class CreateHollers < ActiveRecord::Migration
  def change
    create_table :hollers do |t|
      t.string :content
      t.integer :user_id
      t.string  :original_author
      t.timestamps
    end
  end
end
