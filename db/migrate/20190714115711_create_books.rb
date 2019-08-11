class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false, default: ""
      t.string :author, null: false, default: ""
      t.string :amazon_url, null: false, default: ""
      t.text :memo, null: false
      t.date :published_day, null: true

      t.timestamps
    end
  end
end
