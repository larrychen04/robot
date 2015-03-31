require "robot"
class RobotController < ApplicationController
	def index
		unless params['command'].nil?
			@robot   = Robot.new
			@place  = @robot.robotAction(params['command']['file_name'])
		end
	end
end