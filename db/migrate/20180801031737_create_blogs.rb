class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text          :text
      t.references    :user
      t.timestamps
    end
  end
end
