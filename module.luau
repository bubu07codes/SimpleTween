--SimpleTween by Bubu
--https://devforum.roblox.com/t/simpletween-a-module-to-help-you-animate-ui-and-much-more
--This module is licensed under the MIT LICENSE, more in the LICENSE script

local TweenService = game:GetService("TweenService")

local module = {}

function module.tween(instance: Instance, goal, duration: number, play: boolean): Tween
	duration = duration or 1
	play = play ~= false
	local currentTween = TweenService:Create(instance, TweenInfo.new(duration), goal)
	if play then
		currentTween:Play()
	end
	return currentTween
end

function module.typewriteText(textElement, text: string, waitPerChar: number, playSound: boolean)
	waitPerChar = waitPerChar or 0.05
	playSound = playSound or false
	if textElement then
		for i = 1,#text,1 do
			textElement.Text = string.sub(text,1,i)
			task.wait(waitPerChar)
			if playSound then
				script.TypewriteClick:Play()
			end
		end
	end
end

function module.hideObject(object: GuiObject, duration: number)
	duration = duration or 1
	if object then
		local t = TweenService:Create(object, TweenInfo.new(duration), {Size = UDim2.fromScale(0,0)})
		t:Play()
		t.Completed:Connect(function()
			object.Visible = false
		end)
	end
end

function module.showObject(object: GuiObject, targetSize: UDim2, duration: number)
	duration = duration or 1
	if object then
		local t = TweenService:Create(object, TweenInfo.new(duration), {Size = targetSize})
		t:Play()
		t.Completed:Connect(function()
			object.Size = targetSize
		end)
	end
end

function module.shakeCamera(humanoid: Humanoid, intensity: number, duration: number)
	intensity = intensity or 0.1
	duration = duration or 1

	local originalOffset = humanoid.CameraOffset
	local startTime = tick()

	while tick() - startTime < duration do
		local timeElapsed = tick() - startTime

		local shakeOffset = Vector3.new(
			Random.new().NextNumber(Random.new(), -intensity, intensity),
			Random.new().NextNumber(Random.new(), -intensity, intensity),
			Random.new().NextNumber(Random.new(), -intensity, intensity)
		)

		humanoid.CameraOffset = originalOffset + shakeOffset * (1 - (timeElapsed / duration))

		task.wait()
	end

	humanoid.CameraOffset = originalOffset
end

return module
