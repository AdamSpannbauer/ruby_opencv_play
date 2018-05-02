require_relative 'imutils'
require 'opencv'
include OpenCV

# read image
image = CvMat.load('test_pic.png')

# print image dims
puts "orig image size: (#{image.size.width}, #{image.size.height})"

# perform different resizings and display
new_w = ImUtils.resize(image, new_width: 500)
new_h = ImUtils.resize(image, new_height: 500)
new_wh = ImUtils.resize(image, new_width: 250, new_height: 250)

# loop through resized images and display
for r in [new_w, new_h, new_wh] do
	window_name = "new size: (#{r.size.width}, #{r.size.height})"
	window = GUI::Window.new(window_name)
	window.show(r)

	# Wait for a keystroke in the window.
	GUI::wait_key
end
