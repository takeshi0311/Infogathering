class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.text :title,    unique: true
      t.text :text,     unique: true
      t.text :url,      unique: true
      # t.text :detail,     null: false
      t.timestamps
    end
  end
end
