class ComicsAndSubscribers < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.column :name, :string
      t.column :url, :string
      t.references :subscriber
    end

    create_table :subscribers do |t|
      t.column :name, :string
      t.column :url, :string
      t.references :comics
    end
  end
end
