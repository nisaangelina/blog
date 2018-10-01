class CreateBlogposts < ActiveRecord::Migration[5.2]
  def change
    create_table :blogposts do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.string :content, null: false
      t.references :user, foreign_key: true
      t.string :image_url

      t.timestamps
    end
    add_index :blogposts, [:user_id, :created_at]
  end
end
