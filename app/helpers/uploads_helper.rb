module UploadsHelper
	def toggle_like( upload, current_user)

		if current_user.flagged?(@upload, :like)	
			link_to "unsave", like_upload_path(@upload)
		else
			link_to "save", like_upload_path(@upload)

		end
	end
end
