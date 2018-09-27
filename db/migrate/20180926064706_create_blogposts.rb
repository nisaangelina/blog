class CreateBlogposts < ActiveRecord::Migration[5.2]
  def change
    create_table :blogposts do |t|
      t.string :title
      t.string :summary
      t.string :content
      t.string :string
      t.references :user, foreign_key: true
      t.string :image_url

      t.timestamps
    end
    add_index :blogposts, [:user_id, :created_at]
  end
end
