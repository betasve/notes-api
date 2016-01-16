class NotesTags < ActiveRecord::Migration
  def change
    create_table :notes_tags, id: false do |t|
      t.integer :note_id, index: true
      t.integer :tag_id, index: true
    end
  end
end
