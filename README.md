kame (Japanese for turtle)
==========================

kame is an implementation of the Logo programming language built as a challenge to myself. I wanted a simple way to introduce programming in Ruby to my daughter and thought this would be fun.

With kame, you control the movement of a turtle around a piece of paper by programming commands. With these simple commands your turtle will draw you a picture.

It's a nice introduction to programming for kids and will also help their maths :o)

What it does
------------

You create a Ruby file with commands that instructs a turtle (kame) to move around. You can tell the turtle to move forward or backward, rotate, put his pen down on the paper or pick it up. You can also change the colour of the pen and paper. 

The turtle starts in the top left corner of the kame window facing to the right and will move from there depending on your commands.

Each command is on a new line and they are executed in order.

As this is using Ruby, you also have access to Ruby constructs such as loops and functions.

Notice
------

I've tested this on OSX and it works fine. However, there seems to be an issue on Windows 7 when creating the Gosu window. I'll investigate.

Install
-------

	gem install kame

Simple Sample
-------------

Create a new text file called square.rb and paste the below code in and save it:

	require "kame"

	Kame.new do
	  forward 100
	  turn_right 90
	  forward 100
 
	  colour :red
	  pen_down
 
	  4.times do
	    turn_right 90
	    forward 50     
	  end
	end

More samples
------------

You can find more samples in my [kame_samples](https://github.com/andypike/kame_samples) repro. One of which is this little flower <3

![kame flower](https://github.com/andypike/kame_samples/raw/master/kame-flower.png)

Running
-------

In the console use this:

	ruby square.rb

Commands
--------

To move the turtle forward by 50 pixels from it's current position, you can use the `forward` command:

	forward 50
		
To move the turtle backward by 75 pixels from it's current position, you can use the `backward` command:

	backward 75
		
To tell the turtle to put his pen down onto the paper use the `pen_down` command:
		
	pen_down

To tell the turtle to pick his pen up again, use the `pen_up` command:

	pen_up
	  
You can ask the turtle to rotate 90 degrees to the left (anti-clockwise) on the spot without moving by using the `turn_left` command:

	turn_left 90
	  
You can ask the turtle to rotate 90 degrees to the right (clockwise) on the spot without moving by using the `turn_right` command:

	turn_right 90

You can change the colour of the turtle's pen at any time (on the paper or not) with the `colour` command:

	colour :pink
		
Colours
-------

Here is a list of the available colours:

	:white
	:black
	:red
	:green
	:blue
	:yellow
	:pink
	:grey

Options
-------

In addition to commanding the turtle, there are some options you can specify. You pass these options to the Kame constructor like so:

	Kame.new(:width => 800, :height => 600) do
		...
	end

Here is a list of all options with their default values (all are optional):

	:width => 640 		# The width of the paper in pixels
	:height => 480		# The height of the paper in pixels
	:paper => :white	# The colour of the paper (from the list above)
	:title => 'Kame'  	# The window title
	:speed => 10		# The speed that the turtle draws. This is how many lines per second should be drawn


Contributing to kame
--------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Andy Pike. See LICENSE.txt for further details.


