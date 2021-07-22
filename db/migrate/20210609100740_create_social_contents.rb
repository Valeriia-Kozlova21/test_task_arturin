class CreateSocialContents < ActiveRecord::Migration[6.1]
  def change
    create_table :social_contents do |t|
      t.string :title
      t.string :post

      t.timestamps
    end
  end
end
