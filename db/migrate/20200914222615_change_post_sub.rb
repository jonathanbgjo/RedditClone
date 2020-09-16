class ChangePostSub < ActiveRecord::Migration[5.2]
  def change
    remove_index :post_subs, :post_id
    add_index :post_subs, :post_id

    remove_index :post_subs, :sub_id
    add_index :post_subs, :sub_id
  end
end
