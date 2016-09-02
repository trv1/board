class CreateVelomobiles < ActiveRecord::Migration[5.0]
  def change
    create_table :velomobiles do |t|
      t.integer :price
      t.references :brand, foreign_key: true
      t.integer :c1
      t.integer :c2
      t.integer :c3
      t.string :c4
      t.integer :c5
      t.integer :c6
      t.integer :c7
      t.decimal :c8
      t.string :c9
      t.string :c10
      t.boolean :c11
      t.boolean :c12
      t.integer :c13
      t.string :c14
      t.string :c15
      t.string :c16
      t.string :c17
      t.string :c18
      t.string :c19
      t.string :c20
      t.string :c21
      t.integer :c22
      t.integer :c23
      t.boolean :c24
      t.integer :c25
      t.integer :c26
      t.integer :c27
      t.string :c28
      t.string :c29
      t.string :c30
      t.string :c31
      t.string :c32
      t.string :c33
      t.boolean :c34
      t.boolean :c35
      t.string :c36
      t.integer :c37
      t.integer :c38
      t.boolean :c39
      t.boolean :c40
      t.string :c41
      t.boolean :c42
      t.boolean :c43
      t.boolean :c44
      t.integer :c49
      t.integer :c45
      t.integer :c46
      t.integer :c47
      t.string :c48
      t.decimal :c50
      t.decimal :c51
      t.boolean :c52
      t.string :c53
      t.boolean :c54
      t.boolean :c55
      t.decimal :c56
      t.boolean :c57

      t.timestamps
    end
  end
end
