# window variables
window_width = 1024
window_height = 712
mid_x = window_width / 2
mid_y = window_height / 2

color(200, 150, 0)
fill_circle(mid_x, mid_y, window_height / 3)

color(0, 0, 150)
fill_circle(mid_x + window_height/8, mid_y - window_height/6, window_height / 15)
fill_circle(mid_x - window_height/8, mid_y - window_height/6, window_height / 15)

y_glasses = mid_y - window_height/6 - 50
rectangle(mid_x + window_height/8 - 60, y_glasses, window_height/5, window_height/7)
rectangle(mid_x - window_height/8 - 60, y_glasses, window_height/5, window_height/7)

color(0, 0, 0)
fill_rectangle(mid_x - window_height/8 - 60 + window_height / 5, y_glasses, 40, 20)
fill_rectangle(mid_x + window_height/8 - 275, y_glasses, 50, 20)
fill_rectangle(mid_x + window_height/8 + 75, y_glasses, 50, 20)

color(150, 100, 50)
fill_rectangle(mid_x-40, mid_y-20, 50, 50)

color(200, 200, 200)
fill_circle(mid_x, mid_y + 150, 100)
fill_rectangle(mid_x+100, mid_y + 100, 100, 50)
fill_rectangle(mid_x-200, mid_y + 100, 100, 50)
