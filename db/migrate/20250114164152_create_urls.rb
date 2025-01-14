class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.string :short_url
      t.string :long_url
      t.integer :user_id

      t.timestamps
    end
  end
end
