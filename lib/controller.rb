require_relative 'robot'
require_relative 'view'
class Controller
  def initialize(robot)
    @robot = robot
    @view = View.new
  end

  def place
    return @view.robot_already_placed if %w[north south east west].include?(@robot.facing)

    x_axis = @view.ask_for_x_position
    y_axis = @view.ask_for_y_position
    facing = @view.ask_for_robot_facing
    until x_axis.between?(0, 4) && y_axis.between?(0, 4) && %w[north south east west].include?(facing)
      x_axis = @view.ask_for_x_position unless x_axis.between?(0, 4)
      y_axis = @view.ask_for_y_position unless y_axis.between?(0, 4)
      facing = @view.ask_for_robot_facing unless %w[north south east west].include?(facing)
    end
    start_robot(x_axis, y_axis, facing)
  end

  def report
    @view.display_robot(@robot)
  end

  def turn_right
    case @robot.facing
    when 'north' then @robot.facing = 'east'
    when 'east' then @robot.facing = 'south'
    when 'south' then @robot.facing = 'west'
    when 'west' then @robot.facing = 'north'
    end
    @view.robot_now_facing(@robot)
  end

  def turn_left
    case @robot.facing
    when 'north' then @robot.facing = 'west'
    when 'east' then @robot.facing = 'north'
    when 'south' then @robot.facing = 'east'
    when 'west' then @robot.facing = 'south'
    end
    @view.robot_now_facing(@robot)
  end

  def move
    case @robot.facing
    when 'north' then move_north
    when 'south' then move_south
    when 'east' then move_east
    when 'west' then move_west
    end
  end

  private

  def start_robot(x_axis, y_axis, facing)
    @robot.x = x_axis
    @robot.y = y_axis
    @robot.facing = facing
  end

  def move_north
    if @robot.y < 4
      @robot.y += 1
      @view.moved
    else
      @view.move_off_board
    end
  end

  def move_south
    if @robot.y.zero?
      @view.move_off_board
    else
      @robot.y -= 1
      @view.moved
    end
  end

  def move_east
    if @robot.x < 4
      @robot.x += 1
      @view.moved
    else
      @view.move_off_board
    end
  end

  def move_west
    if @robot.x.zero?
      @view.move_off_board
    else
      @robot.x -= 1
      @view.moved
    end
  end
end
