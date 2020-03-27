class AddVoucherNumberIntoPurchases < ActiveRecord::Migration[6.0]
  def change
  	add_column :purchases, :voucher_id, :integer
  end
end
