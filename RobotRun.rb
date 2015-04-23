#!/use/bin/env ruby
require "Robot.rb"


Robot1 = Robot.new #Create Robot
Robot1.REPORT #Check position before placing

Robot1.MOVE #Check that Robot isn't receiving commands until valid placement 
Robot1.LEFT #Check that Robot isn't receiving commands until valid placement 
Robot1.RIGHT #Check that Robot isn't receiving commands until valid placement 
Robot1.PLACE(0,0,"east") #Place the robot on the table
Robot1.REPORT #Verify Robot position


#Moving on the edge

Robot1.MOVE #Try to walk over the East edge (0,0)
Robot1.REPORT
Robot1.RIGHT #Turn the Robot towards South 
Robot1.REPORT
Robot1.MOVE #Try to walk over the South edge (0,0)
Robot1.REPORT
Robot1.RIGHT #Turn the Robot towards West 
Robot1.REPORT
Robot1.MOVE #walking on the South edge 
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE #Try to walk over the West edge (4,0)
Robot1.REPORT
Robot1.RIGHT #Turn the Robot towards North
Robot1.REPORT
Robot1.MOVE #walking on the North edge
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE #Try to walk over the North edge (4,4)
Robot1.RIGHT #Turn the Robot towards East
Robot1.REPORT
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE #Try to walk over the East edge (0,4)
Robot1.LEFT  #Turn the Robot towards North
Robot1.REPORT
Robot1.LEFT  #Turn the Robot towards West
Robot1.REPORT
Robot1.LEFT  #Turn the Robot towards South
Robot1.REPORT
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE
Robot1.MOVE #Try to walk over the South edge (0,0)
Robot1.LEFT  #Turn the Robot towards East
Robot1.REPORT
Robot1.MOVE #Try to walk over the East edge (0,0)
Robot1.REPORT
Robot1.PLACE(4,1,"South") #Place the robot on new location on the table
Robot1.REPORT #Verify Robot position