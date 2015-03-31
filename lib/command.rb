class Command
   def initialize(name, x=nil, y=nil, f=nil)
    	@name,@x,@y,@f = name, x, y, f
   end

	def x
		@x
	end

	def y
		@y
	end

	def f
		@f
	end

	def name
		@name
	end

	def validateCommand
		if !validateCommandName
			return false
		end

		if @name == 'PLACE'
			return validateX && validateY && validateFace
		end

		return true
	end

	def validateX
		if @x.nil? || @x < 0 || @x > 5
			return false
		else
			return true
		end
	end

	def validateY
		if @y.nil? || @y < 0 || @y > 5
			return false
		else
			return true
		end
	end

	def validateCommandName
		commands = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']
	   return commands.include?(@name)   
	end

	def validateFace
		faces = ['NORTH', 'SOUTH', 'EAST', 'WEST']
	   return faces.include?(@f)
	end

end