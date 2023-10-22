from pynput import mouse, keyboard
from playsound import playsound

class soundManager():
    sounds = ['yes1.mp3','yes2.mp3','yes3.mp3'] 
    i = 0

    def play_sounds(self):
        current_sound = self.sounds[self.i % len(self.sounds)] # will cycle through again once list is exhausted
        playsound(current_sound)
        self.i += 1 # moves to the next index

class inputListener():

    def __init__(self):
        self.click_sounds = soundManager()
        self.stop_listening = False
        
        self.mouse_listener = mouse.Listener(on_click=self.on_click)
        self.mouse_listener.start()

        self.key_listener = keyboard.Listener(on_press=self.on_key_press)
        self.key_listener.start()

        self.mouse_listener.join()
        self.key_listener.join()

    def on_click(self, x, y, button, pressed):
        if self.stop_listening:
            return False
        if pressed:
            self.click_sounds.play_sounds()

    def on_key_press(self, key):
        if key == keyboard.Key.esc: # stop the script if the user hits the esc key
            self.stop_listening = True
            return False
        
listener_monitor = inputListener()