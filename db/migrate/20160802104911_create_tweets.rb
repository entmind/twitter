class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content, limit: 255    # 追記したよ。
      
      t.timestamps null: false
    end
  end
end
