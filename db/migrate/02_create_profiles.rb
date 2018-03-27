class CreateProfiles < ActiveRecord::Migration[4.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :user_id
      t.integer :sentiment_id
    end
  end
end
