local TweenService = game:GetService("TweenService")

local module = {}

function module.tween(instance: Instance, goal, duration: number, play:boolean): Tween
	duration = duration or 1
	play = play or true
	local currentTween = TweenService:Create(instance, TweenInfo.new(duration), goal)
	if play then
		currentTween:Play()
	end
	return currentTween
end

return module
