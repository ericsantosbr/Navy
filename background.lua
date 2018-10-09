-- background file for Navy

local bg = {}

function bg.new()
	local newBg = {}
	local objects = {}
	newBg.objects = objects
	newBg.getObjNum = function(self)
		return #self.objects
	end
	return newBg
end

return bg