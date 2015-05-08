#!/usr/bin/python

x=raw_input('Insert a Word ')
y=x[::-1]
if x==y:
	print 'It is a Pailidrome'
	print y
else:
	print "It's not a Paildrome"
	print y
print x
