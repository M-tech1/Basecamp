class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      # t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :description
      # t.string :user_id

      t.timestamps
    end
  end
end
