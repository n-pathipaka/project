# window variables
window_width = 1024
window_height = 712
mid_x = window_width / 2
mid_y = window_height / 2
# draw the head
head_size = window_height / 3
circle(mid_x, mid_y, head_size)
rotate(45)
fill_rectangle(mid_x, mid_y + head_size / 2, 20, 100)
