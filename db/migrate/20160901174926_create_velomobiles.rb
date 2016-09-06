class CreateVelomobiles < ActiveRecord::Migration[5.0]
  def change
    create_table :velomobiles do |t|
      t.integer :price
      t.references :brand, foreign_key: true
      t.integer :c1, limit: 2
      t.integer :c2, limit: 2
      t.integer :c3, limit: 2
      t.integer :c4, limit: 2
      t.integer :c5, limit: 2
      t.integer :c6, limit: 2
      t.integer :c7, limit: 2
      t.decimal :c8
      t.integer :c9, limit: 2
      t.integer :c10, limit: 2
      t.boolean :c11
      t.boolean :c12
      t.integer :c13, limit: 2
      t.integer :c14, limit: 2
      t.integer :c15, limit: 2
      t.integer :c16, limit: 2
      t.integer :c17, limit: 2
      t.integer :c18, limit: 2
      t.integer :c19, limit: 2
      t.integer :c20, limit: 2
      t.integer :c21, limit: 2
      t.integer :c22, limit: 2
      t.integer :c23, limit: 2
      t.boolean :c24
      t.integer :c25, limit: 2
      t.integer :c26, limit: 2
      t.integer :c27, limit: 2
      t.integer :c28, limit: 2
      t.integer :c29, limit: 2
      t.integer :c30, limit: 2
      t.integer :c31, limit: 2
      t.integer :c32, limit: 2
      t.integer :c33, limit: 2
      t.boolean :c34
      t.boolean :c35
      t.integer :c36, limit: 2
      t.integer :c37, limit: 2
      t.integer :c38, limit: 2
      t.boolean :c39
      t.boolean :c40
      t.integer :c41, limit: 2
      t.boolean :c42
      t.boolean :c43
      t.boolean :c44
      t.integer :c49, limit: 2
      t.integer :c45, limit: 2
      t.integer :c46, limit: 2
      t.integer :c47, limit: 2
      t.integer :c48, limit: 2
      t.decimal :c50
      t.decimal :c51
      t.boolean :c52
      t.integer :c53, limit: 2
      t.boolean :c54
      t.boolean :c55
      t.decimal :c56
      t.boolean :c57

      t.timestamps
    end
  end
end
