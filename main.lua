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

function module.typewriteText(textLabel: TextLabel, text: string, waitPerChar: number, playSound: boolean)
	waitPerChar = waitPerChar or 0.05
	playSound = playSound or false
	if textLabel then
		for i = 1,#text,1 do
			textLabel.Text = string.sub(text,1,i)
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

return module
