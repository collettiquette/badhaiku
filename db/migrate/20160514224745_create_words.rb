class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :part_of_speech
      t.integer :syllable_count
    end
  end
end
