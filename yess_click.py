from pynput import mouse
from playsound import playsound

# List of sounds to be played
sounds = ['yes1.mp3','yes2.mp3','yes3.mp3']
i = 0

# What to do when the mouse button is clicked
def on_click(x, y, button, pressed):
    global i
    if pressed:
        current_sound = sounds[i % len(sounds)] # will cycle through again once list is exhausted
        playsound(current_sound)
        i += 1 # moves to the next index

with mouse.Listener(on_click=on_click) as listener:
    listener.join()