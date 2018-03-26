class CreateSentiments < ActiveRecord::Migration[4.2]
  def change
    create_table :sentiments do |t|
      t.string :sentiment
    end
  end
end
