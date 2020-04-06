class CreateInfoUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :info_users do |t|
      t.references :info, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
