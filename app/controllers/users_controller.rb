class UsersController < ApplicationController
	before_action :set_user
	def purchase_item
		purchase = @user.purchases.new(purchase_params)
		if purchase.valid? && purchase.save! 
			render jsonapi: purchase, status: '201', include:[:user, :video_content]
		else
			render jsonapi_errors: purchase.errors, code: '422',
                 status: :unprocessable_entity
		end
	end

	def library
		purchased_videos = @user.purchases.available_videos.order(created_at: :asc)
		render jsonapi: purchased_videos, include:[:video_content]
	end

	private

	def set_user
		@user = User.find_by_id(params[:id])
	end

	def purchase_params
		params.require(:purchase).permit(:price, :video_quality, :video_content_id, :voucher_number)
	end

	def find_voucher

	end
end