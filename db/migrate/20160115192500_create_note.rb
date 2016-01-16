class CreateNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body

      t.timestamp
    end
  end
end
