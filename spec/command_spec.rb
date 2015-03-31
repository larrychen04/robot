require "command"

describe Command do 
	it "X can not be nil in PLACE Command" do
		expect(Command.new("PLACE").validateCommand).to eq(false)
	end
	it "X can not be less than 0 in PLACE Command" do
		expect(Command.new("PLACE", -1, 1, "NORTH").validateCommand).to eq(false)
	end
	it "X can not be greate than 5 in PLACE Command" do
		expect(Command.new("PLACE", 6, 1, "NORTH").validateCommand).to eq(false)
	end
	it "Y can not be nil in PLACE Command" do
		expect(Command.new("PLACE").validateCommand).to eq(false)
	end
	it "Y can not be less than 0 in PLACE Command" do
		expect(Command.new("PLACE", -1, 1, "NORTH").validateCommand).to eq(false)
	end
	it "Y can not be greate than 5 in PLACE Command" do
		expect(Command.new("PLACE", 6, 1, "NORTH").validateCommand).to eq(false)
	end
	it "Face is wrong name in PLACE Command" do
		expect(Command.new("PLACE", 1, 1, "NORTH2").validateCommand).to eq(false)
	end
	it "Every thing is correct in PLACE Command" do
		expect(Command.new("PLACE", 1, 1, "NORTH").validateCommand).to eq(true)
	end
	it "Command name is wrong" do
		expect(Command.new("PLACE2", 1, 1, "NORTH").validateCommand).to eq(false)
	end
end