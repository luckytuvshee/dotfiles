#!python

# dependencies
# pacman -S python-xlib
# pacman -S python-pillow

import sys
from Xlib import X, display
import PIL.Image # python-imaging
import PIL.ImageStat # python-imaging
import Xlib.display # python-xlib

def get_pixel_colour(i_x, i_y):
	o_x_root = Xlib.display.Display().screen().root
	o_x_image = o_x_root.get_image(i_x, i_y, 1, 1, Xlib.X.ZPixmap, 0xffffffff)
	o_pil_image_rgb = PIL.Image.frombytes("RGB", (1, 1), o_x_image.data, "raw", "BGRX")
	lf_colour = PIL.ImageStat.Stat(o_pil_image_rgb).mean
	return tuple(map(int, lf_colour))

# Screen

d = display.Display()

screen = d.screen()

# Draw on the root window (desktop surface)
window = screen.root

cursor = X.NONE

window.grab_pointer(1, X.PointerMotionMask|X.ButtonReleaseMask|X.ButtonPressMask,
                X.GrabModeAsync, X.GrabModeAsync, X.NONE, cursor, X.CurrentTime)

window.grab_keyboard(1, X.GrabModeAsync, X.GrabModeAsync, X.CurrentTime)


done = False
started = False
start   = dict(x=0, y=0)
end     = dict(x=0, y=0)
last    = None
i = 0

while done == False:
  e = d.next_event()

  # Window has been destroyed, quit
  if e.type == X.DestroyNotify:
    sys.exit(0)

  # Mouse button press
  elif e.type == X.ButtonPress:
      # Left mouse button?
      if e.detail == 1:
        start = dict(x=e.root_x, y=e.root_y)
        started = True

      # Right mouse button?
      elif e.detail == 3:
        sys.exit(0)

  # Mouse button release
  elif e.type == X.ButtonRelease:
    end = dict(x=e.root_x, y=e.root_y)
    if last:
      draw_rectangle(start, last)
    done = True
    pass

  # Keyboard key
  elif e.type == X.KeyPress:
    sys.exit(0)

d.flush()

if len(sys.argv) > 1 and sys.argv[1] == "hex":
  print('#%02x%02x%02x' % get_pixel_colour(start['x'], start['y']))
else:
  print(get_pixel_colour(start['x'], start['y']))

sys.exit(0)
