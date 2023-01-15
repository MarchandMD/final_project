class CreateLearningResources < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_resources do |t|
      t.string :country
      t.string :video
      t.string :images

      t.timestamps
    end
  end
end
