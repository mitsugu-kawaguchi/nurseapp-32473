class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name,          null: false
      t.datetime :start_time,  null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
