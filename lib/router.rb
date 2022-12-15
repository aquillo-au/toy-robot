class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts 'Welcome to toy robot'
    puts '           --       '

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.place
    when 2 then @controller.move
    when 3 then @controller.turn_left
    when 4 then @controller.turn_right
    when 5 then @controller.report
    when 6 then stop
    else
      puts 'Please press 1 - 6'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - Place the robot'
    puts '2 - Move the robot'
    puts '3 - Make a Left turn'
    puts '4 - Make a Right turn'
    puts '5 - Report the location of the robot'
    puts '6 - Stop and exit the program'
  end
end
