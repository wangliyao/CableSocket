class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.text :tag

      t.timestamps
    end
  end
end
