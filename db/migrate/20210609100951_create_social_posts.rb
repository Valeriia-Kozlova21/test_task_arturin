class CreateSocialPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :social_posts do |t|
      t.string :social_network
      t.datetime :schedule_time
      t.references :social_content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
