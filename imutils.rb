require 'opencv'
include OpenCV

module ImUtils
	module_function

	# function to use aspect ratio for easier resizing
	def resize(image, new_width: nil, new_height: nil, method: CV_INTER_LINEAR)
		# get current image dims
		w = image.columns
		h = image.rows

		# check if user provided any resize info
		if new_height.nil? && new_width.nil?
			raise 'must provide width or height to resize'
		end

		# calc new height if not provided
		if new_height.nil?
			new_height = (h.to_f / w * new_width).to_i
		end

		# calc new width if not provided
		if new_width.nil?
			new_width = (w.to_f / h * new_height).to_i
		end

		return image.resize(CvSize.new(new_width, new_height), method)
	end
end
