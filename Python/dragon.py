#!/usr/bin/python

import random
import time

def displayIntro():
	print ('You are on a planet full of dragon. In front of you,')
	print ('You see two caves. In one cave, the dragon is friendly')
	print ('and will share his treasure with you. The other dragon')
	print ('is greedy and hungry, and you will be devoured!')
	print ()

def chooseCave():
	cave=''
	while cave != '1' and cave != '2':
		print ('Which cave will you go into? (1 or 2)')
		cave = raw_input()

	return 

def checkCave (chosenCave):
	print ('You approach the cave...')
	time.sleep(2)
	print ("It's dark and spooky...")
	time.sleep(2)
	print ('A large dragon jumps out in front of you! He opens his jaws and...')
	print ()
	time.sleep(3)

	friendlyCave=random.randint(1,2)

	if chosenCave==str(friendlyCave):
		print ('Gives you his treasure')
	else:
		print ('Devoures your whole body and soul in one gulp!')
		time.sleep(2)
		print ('Better luck in the next world :/')
		time.sleep(2)

	
	
playAgain='yes'
while playAgain=='yes' or playAgain=='y' or playAgain=='ye':

	displayIntro()

	caveNumber=chooseCave()

	checkCave(caveNumber)
	

	print ('Do you want to play again? (yes or no)')
	playAgain=raw_input()
