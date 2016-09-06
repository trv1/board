class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.integer :price
      t.references :brand, foreign_key: true
      t.integer :c1, limit: 2
      t.integer :c2, limit: 2
      t.integer :c3, limit: 2
      t.integer :c4, limit: 2
      t.integer :c5, limit: 2
      t.integer :c6, limit: 2
      t.integer :c7, limit: 2
      t.boolean :c8
      t.boolean :c9
      t.boolean :c10
      t.integer :c11, limit: 2
      t.integer :c12, limit: 2
      t.integer :c13, limit: 2
      t.integer :c14, limit: 2
      t.decimal :c15
      t.decimal :c16
      t.integer :c17, limit: 2
      t.integer :c18, limit: 2
      t.boolean :c19
      t.integer :c20, limit: 2
      t.integer :c21, limit: 2
      t.boolean :c22
      t.boolean :c23
      t.boolean :c24
      t.boolean :c25
      t.boolean :c26
      t.integer :c27, limit: 2
      t.boolean :c28
      t.boolean :c29
      t.boolean :c30
      t.boolean :c31
      t.boolean :c32
      t.integer :c33, limit: 2
      t.integer :c34, limit: 2
      t.boolean :c35
      t.boolean :c36
      t.boolean :c37
      t.boolean :c38
      t.integer :c39, limit: 2
      t.integer :c40, limit: 2
      t.integer :c41, limit: 2
      t.integer :c42, limit: 2
      t.integer :c43, limit: 2
      t.integer :c44, limit: 2
      t.integer :c45, limit: 2
      t.integer :c46, limit: 2
      t.integer :c47, limit: 2
      t.integer :c48, limit: 2
      t.integer :c49, limit: 2
      t.integer :c50, limit: 2
      t.boolean :c51
      t.integer :c52, limit: 2
      t.integer :c53, limit: 2
      t.integer :c54, limit: 2
      t.integer :c55, limit: 2
      t.integer :c56, limit: 2
      t.integer :c57, limit: 2
      t.integer :c58, limit: 2
      t.integer :c59, limit: 2
      t.integer :c60, limit: 2
      t.boolean :c61
      t.boolean :c62
      t.boolean :c63
      t.integer :c64, limit: 2
      t.integer :c65, limit: 2
      t.integer :c66, limit: 2
      t.boolean :c67
      t.boolean :c68
      t.integer :c69, limit: 2
      t.integer :c70, limit: 2
      t.integer :c71, limit: 2
      t.boolean :c72
      t.boolean :c73
      t.boolean :c74
      t.boolean :c75
      t.boolean :c76
      t.boolean :c77
      t.boolean :c78
      t.integer :c79, limit: 2
      t.integer :c80, limit: 2
      t.decimal :c81
      t.decimal :c82
      t.decimal :c83
      t.boolean :c84
      t.boolean :c85
      t.boolean :c86
      t.integer :c87, limit: 2
      t.boolean :c88
      t.boolean :c89

      t.timestamps
    end
  end
end
