#!/usr/bin/python

x=raw_input('How old are you?')
y=raw_input('Ok....but How old are you really?')
z=y
if x==y:
	birthyear=raw_input('Enter your birth year')
	import time;
	t=time.localtime(time.time())[0]
	birthyear=int(birthyear)
	age=t-birthyear
	if age<z:
		print 'Your Lying to Me'
	if age>=z:
		print 'Welcome Buddy'
	print age
else:
	print 'No'
