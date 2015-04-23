#!/use/bin/env ruby
class Robot
  
  
  #Default constructor for Robot  Class
  def initialize 
      @@FACE = nil #This variable will hold the direction on which the Robot is facing
      @@X=  nil #This variable will hold the X coordinate  
      @@Y = nil #This variable will hold the Y coordinate
      
       @@ValidPlace = 0 #This variable will act as a flag signalling that the Robot is ready to recive MOVE, LEFT, RIGHT commands 
      @@_oldY = nil #This variable will hold the old Y coordinate (for use with Rollback action)
      @@_oldX = nil #This variable will hold the old X coordinate (for use with Rollback action)
      @@_oldFace = nil  #This variable will hold the old direction on which the Robot is facing (for use with Rollback action)
  end
    

 ##Define the location of the Robot on the screen
 ##This Method will use two Help Methods(internal methods)
 ##1. _saveDataForRollBack - This Method will save the previous coordinate in case of failure.
 ##   will be used by the _rollBack action
 ##2. _rollBack - This method will use the data saved by the _saveDataForRollBack Method in order to return the robot to  a valid
 ##   coordinate and prevent it from falling off the table
 def PLACE (x , y ,face)
   
   _saveDataForRollBack #Calling the Method "_saveDataForRallBack" in-order to save the data (for use with Rollback action)
   
   if 0 <= x && x < 5  #Checking if the value of the X coordinate is inside the given table ( 0 <= X < 5 )
     @@X = x #In case the X value is correct set X to its new Value
     if  0 <= y && y < 5 #Checking if the value of the Y coordinate is inside the given table ( 0 <= Y < 5 )
       @@Y = y #In case the Y value is correct, this statement  will set Y to its new Value
       
       
      #This switch case transforms the input FACE data to numerical values 
      case face.upcase #Changing the face to be uppercase in order to prevent input errors
        when "EAST" #We will represent each direction with a number between zero to four.
                    #This will help to change the heading using modulo oporator
          @@FACE = 0
          @@ValidPlace = 1
        when "SOUTH"
          @@FACE = 1
          @@ValidPlace = 1
        when "WEST"
          @@FACE = 2
          @@ValidPlace = 1
        when "NORTH"
         @@FACE = 3
         @@ValidPlace = 1
        else
          puts "FACE variable should be one of the following :
          EAST, WEST, NORTH, SOUTH" 
          _rollBack #Trigger a rollback action in case of illigal Face input
          @@ValidPlace = 0
           break 
       end
       
     else #Else for Y coordinate check
       puts("y should have a value between 0 to 4")
       _rollBack #Trigger a rollback action in case of illigal Y coordinate
       @@ValidPlace = 0
       break
     end
   else #Else for X coordinate check
     puts("x should have a value between 0 to 4")
     _rollBack #Trigger a rollback action in case of illigal X coordinate
     @@ValidPlace = 0
     break
   end
 end
 
 

 
  #Turning Right will change the heading  90 degrees clockwise.
  def RIGHT
    if @@ValidPlace == 1
      @@FACE = (@@FACE+1)%4
    else
      puts "Robot is not yet placed on a valid place on table"
    end
  end
  
  #Turning Right will change the heading 270 degrees clockwise.
  def LEFT
    if @@ValidPlace == 1
      @@FACE = (@@FACE+3)%4
    else
      puts "Robot is not yet placed on a valid place on table"
    end
  end
  
  
  def MOVE
    if @@ValidPlace == 1
      _saveDataForRollBack
      _MOVE
      _checkMove
    else
      puts "Robot is not yet placed on a valid place on table"
    end
  end
  

  
  #Report will return the location of the Robot on the screen
  def REPORT
    if @@ValidPlace == 1
      @_Face = nil #Local Variable that will be used to transform
      
      case @@FACE
      when 0
        @_Face = "EAST"
      when 1
        @_Face = "SOUTH"
      when 2
        @_Face = "WEST"
      when 3
        @_Face = "NORTH"
      else
        puts "Face value in set to an illegal value.
        FACE variable should be one of the following :
        EAST, WEST, NORTH, SOUTH " 
      end
      
      puts "#{@@X} , #{@@Y} ,#{@_Face}"
    else
      puts "Robot is not yet placed on a valid place on table"
    end
  end
  
  ################################
  #                              #
  #   Internal private Methods   #
  #                              #
  ################################
  #This method will save the data before performing a move this in order to provide rollback support.
  private
  def _saveDataForRollBack
    #Saving the data in-order to create a rollback action
    @@_oldY = @@Y
    @@_oldX = @@X
    @@_oldFace = @@FACE
  end
  
  
  #Rollback action in order to restore data to its original state after an illigal command had been issued.
  private
  def _rollBack
    @@Y = @@_oldY
    @@X = @@_oldX
    @@FACE = @@_oldFace
    
  end
  #This Method will verify each movement. In the case that the move will lead to
  #an illigal coordinate the method will triger a rollback mechanism
  private
  def _checkMove
    @output = "Move confirmed"
    if 0 <= @@X && @@X < 5 
     
     if  0 <= @@Y && @@Y < 5
        puts "#{@output} => New location X coordinate: #{@@X}
                  New location Y coordinate: #{@@Y}"
     else
       puts "Y variable is set outside of boundaries"
       _rollBack
     end
    else
      puts  "X variable is set outside of boundaries"
     _rollBack
    end
   
    
  end
  
  
  #This will method will move the Robot on top of the table
  #South,East is (0,0)
  private
  def _MOVE
    
    case @@FACE
    when 0
      @@X = @@X - 1
    when 1
      @@Y = @@Y - 1
    when 2
      @@X = @@X + 1
    when 3
      @@Y = @@Y + 1
    end
 
  end
 
 
   
  
end



