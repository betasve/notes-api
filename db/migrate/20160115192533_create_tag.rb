class CreateTag < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamp
    end
  end
end
