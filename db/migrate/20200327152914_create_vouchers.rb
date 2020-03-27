class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.string :voucher_number

      t.timestamps
    end
  end
end
