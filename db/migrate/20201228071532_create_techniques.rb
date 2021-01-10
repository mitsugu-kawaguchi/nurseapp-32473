class CreateTechniques < ActiveRecord::Migration[6.0]
  def change
    create_table :techniques do |t|
      t.string   :title,               null: false
      t.integer  :priority_id,         null: false
      t.text     :description,         null: false
      t.date     :target_on,           null: false
      t.date     :completed_on,        null: false
      t.string   :video,               null: false
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
