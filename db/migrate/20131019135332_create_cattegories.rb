class CreateCattegories < ActiveRecord::Migration
  def change
    create_table :cattegories do |t|
      t.string :name

      t.timestamps
    end
  end
end
