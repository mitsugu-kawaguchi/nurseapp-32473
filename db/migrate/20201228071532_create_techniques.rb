class CreateTechniques < ActiveRecord::Migration[6.0]
  def change
    create_table :techniques do |t|
      t.string   :title,               null: false
      t.integer  :priority_id,         null: false
      t.text     :description,         null: false
      t.datetime :target_at,           null: false
      t.datetime :completed_at,        null: false
      t.boolean  :completed
      t.string   :video
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
