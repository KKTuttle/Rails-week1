class CreateDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :definitions do |t|
      t.column :content, :string
      t.column :word_id, :integer

      t.timestamps

    end

  end
end
