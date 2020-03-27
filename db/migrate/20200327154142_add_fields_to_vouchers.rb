class AddFieldsToVouchers < ActiveRecord::Migration[6.0]
  def change
  	add_column :vouchers, :used, :boolean, default: false
  end
end
