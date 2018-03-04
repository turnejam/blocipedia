class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|

      t.timestamps
      t.references :user, foreign_key: true
      t.belongs_to :wiki, foreign_key: true
    end
  end
end
