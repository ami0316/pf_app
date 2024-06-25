class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.references :room, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      # referencesにすることでindexが自動付与
      # 外部キーには主キー+_idが必要だが、referecesの場合は不要
      # foreign_key:trueで外部キー制約が設定される

      t.timestamps
    end
  end
end
