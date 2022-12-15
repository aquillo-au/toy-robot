require_relative 'robot'
require_relative 'controller'
require_relative 'router'

robot = Robot.new
controller = Controller.new(robot)

router = Router.new(controller)

# Start the app
router.run
