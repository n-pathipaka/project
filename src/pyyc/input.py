x = 200
y = 200
size = 50
xdir = 1
ydir = 1
i = 0
while i < 10000:
    if x > 400:
        xdir = -1
    if x < 100:
        xdir = 1
    clear()
    color(100, 200, 150)
    fill_circle(x, y, size)
    x = x + xdir
    i = i + 1
