 #!/usr/bin/python

birthyear=raw_input('Enter your birth year')

import time;

t=time.localtime(time.time())[0]

birthyear=int(birthyear)

age=t-birthyear

print age




