require "command"
class Robot
	def initialize
		@x, @y, @f = nil, nil, nil
		@commands = Array.new
	end

	def readFile filename
		begin 
			filepath = File.dirname(__FILE__)
			f = File.open("#{filepath}/#{filename}", "r")
			f.each_line do |line|
			  puts "0000000000#{line}"
			  commandname = line.to_s.split(' ')[0]
			  place 	  = line.to_s.split(' ')[1]
			  if place.nil?
			  	addCommand commandname
			  else
			  	addCommand commandname, place.to_s.split(',')[0].to_i, place.to_s.split(',')[1].to_i, place.to_s.split(',')[2]
			  end
			end
			f.close
		rescue
			return nil
		end
	end

	def addCommand commandname=nil, x=nil, y=nil, f=nil
		command = Command.new(commandname, x, y, f)
		if command.validateCommand
			@commands.push(command)
		end
	end

	def robotAction filename
		readFile filename
		action @commands
	end

	def action commands
		commands.each do |command|
			if (@x.nil? && @y.nil? && @f.nil? && (command.name == 'PLACE')) || !(@x.nil? && @y.nil? && @f.nil?)
				case command.name
			        when 'PLACE'
			        	placeCommand command
			        when 'MOVE'
			        	moveCommand
			        when 'LEFT'
			        	leftCommand
			        when 'RIGHT'
			        	rightCommand
			        when 'REPORT'
			        	return reportCommand
			        end
			end
		end
		return nil
	end

	def placeCommand command
		@x = command.x
		@y = command.y
		@f = command.f
	end

	def reportCommand
		return "#{@x} #{@y} #{@f}"
	end

	def moveCommand
    	case @f
			when 'NORTH'
				@y = @y + 1
			when 'SOUTH'
				@y = @y - 1
			when 'EAST'
				@x = @x + 1
			else
				@x = @x - 1
			end 
		if !validatePlace
			rollbackMoveCommand
		end
	end

	def rollbackMoveCommand
	    case @f
	      when 'NORTH'
	        @y = @y - 1
	      when 'SOUTH'
	        @y = @y + 1
	      when 'EAST'
	        @x = @x - 1
	      else
	        @x = @x + 1
	      end 
  	end

	def leftCommand
		case @f
	        when 'NORTH'
	          @f = 'WEST'
	        when 'SOUTH'
	          @f = 'EAST'
	        when 'EAST'
	          @f = 'NORTH'
	        else
	          @f = 'SOUTH'
	        end 
	end

	def rightCommand
		case @f
	        when 'NORTH'
	          @f = 'EAST'
	        when 'SOUTH'
	          @f = 'WEST'
	        when 'EAST'
	          @f = 'SOUTH'
	        else
	          @f = 'NORTH'
	        end
	end

	def validatePlace
		if @x.nil? || @x < 0 || @x > 5 || @y.nil? || @y < 0 || @y > 5
		  return false
		else
		  return true
		end
	end
end