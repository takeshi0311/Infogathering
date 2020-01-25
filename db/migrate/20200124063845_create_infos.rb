class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.text :title,    null: false
      t.text :text,     null: false
      t.text :detail,     null: false
      t.timestamps
    end
  end
end
