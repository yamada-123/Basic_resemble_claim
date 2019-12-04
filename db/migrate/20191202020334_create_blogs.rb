class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      #この中にカラムを追加するコードを記述していきます。
      t.string :title
      t.text :content
    end
  end
end
