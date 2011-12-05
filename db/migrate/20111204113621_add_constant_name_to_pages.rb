class AddConstantNameToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :constant_name, :string
  end

  def self.down
    remove_column :pages, :constant_name
  end
end
