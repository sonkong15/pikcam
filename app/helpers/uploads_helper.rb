module UploadsHelper
	def toggle_like( upload, current_user)

		if current_user.flagged?(@upload, :like)	
			link_to "unFav", like_upload_path(@upload)
		else
			link_to "Fav", like_upload_path(@upload)

		end
	end
end
