from pynput import mouse, keyboard
from playsound import playsound

# List of sounds to be played
sounds = ['yes1.mp3','yes2.mp3','yes3.mp3']
i = 0

stop_listening = False

# What to do when the mouse button is clicked
def on_click(x, y, button, pressed):
    global i
    global stop_listening
    if stop_listening:
        return False
    if pressed:
        current_sound = sounds[i % len(sounds)] # will cycle through again once list is exhausted
        playsound(current_sound)
        i += 1 # moves to the next index

def on_key_press(key):
    global stop_listening
    if key == keyboard.Key.esc: # stop the script if the user hits the esc key
        stop_listening = True
        return False
    
mouse_listener = mouse.Listener(on_click=on_click)
mouse_listener.start()

key_listener = keyboard.Listener(on_press=on_key_press)
key_listener.start()

mouse_listener.join()
key_listener.join()