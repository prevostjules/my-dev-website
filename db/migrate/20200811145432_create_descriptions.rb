class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.references :project, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
