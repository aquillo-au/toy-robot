class View

  def ask_for_x_position
    puts 'what is the X position for the robot?'
    puts 'select 0-4'
    gets.chomp.to_i
  end

  def ask_for_y_position
    puts 'what is the y position for the robot?'
    puts 'select 0-4'
    gets.chomp.to_i
  end

  def ask_for_robot_facing
    puts 'what direction is the robot facing?'
    puts 'please enter north, south, east or west'
    gets.chomp
  end

  def display_robot(robot)
    puts "The robot is currently facing #{robot.facing} on square #{robot.x}, #{robot.y}"
  end

  def move_off_board
    puts 'sorry that would make the robot fall off the board'
  end

  def moved
    puts 'The robot has moved forward'
  end

  def robot_now_facing(robot)
    puts "The robot is now facing #{robot.facing}"
  end

  def robot_already_placed
    puts "The robot is already on the board"
  end
end
