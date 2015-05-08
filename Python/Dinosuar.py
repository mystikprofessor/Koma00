#!/usr/bin/python

import time
import random

def tdacIntro():
	print ('You find yourself in a large clearing.')
	print ('Your starving and are desperate for food.')
	print ('You see a series of 6 eggs lying in a circle')
	print ('As you approach them you hear noise.')
	print ('Coming from inside some of them.')
	print ()

def chosenEgg():
	egg=''
	while (egg==''):
		print ('Which egg will you choose')
		egg=raw_input()

	return egg

def checkEgg(chosenEgg):
	print ('You approach the egg')
	time.sleep(2)
	print ('Give it a good tap with a stick')
	time.sleep(2)
	print ('It shakes around for a little while and...')
	print ()
	time.sleep(2)

	harmlessegg=random.randint(1,6)

	if chosenEgg==str(harmlessegg):
		print ('You see a Delecious Yolk ready to cook')
	else:
		print ('A deadly black acid explodes from the egg coats your body and eats your flesh away')
	
	
playAgain='yes'
while playAgain=='yes' or playAgain=='y' or playAgain=='ye':

	
	tdacIntro()

	eggNumber=chosenEgg()

	checkEgg(eggNumber)

	print ('Do you want to play again? (yes or no)')
	playAgain=raw_input()
