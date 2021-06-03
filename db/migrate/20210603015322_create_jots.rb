class CreateJots < ActiveRecord::Migration[6.1]
  def change
    create_table :jots do |t|
      t.references :image, null: false, foreign_key: true
      t.string :type
      t.string :title
      t.string :datetime
      t.string :location

      t.timestamps
    end
  end
end
