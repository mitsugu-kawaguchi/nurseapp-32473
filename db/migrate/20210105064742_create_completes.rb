class CreateCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :completes do |t|
      t.boolean    :completed,              null: false, default: false
      t.references :user,                   null: false, foreign_key: true
      t.references :technique,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
