class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :title,    null: false
      t.string :text,     null: false
      t.timestamps
    end
  end
end
