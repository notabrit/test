-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-04-14 12:44:14
-- Luau version 6, Types version 3
-- Time taken: 0.009115 seconds

script.Parent = game.Players.vainplays_pf.PlayerGui.CrewGui
script.Name = "LoaderGUIScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer_upvr = game.Players.LocalPlayer
local Notification_upvr = LocalPlayer_upvr.PlayerGui:WaitForChild("Notify"):WaitForChild("Notification")
local Parent_upvr = script.Parent
local tbl_4_upvr = {}
local var10_upvw
local tbl_6_upvw = {}
for i, v in {"AP", "APHE", "HEAT", "HE", "PROXIMITY FUZE"} do
	tbl_6_upvw[v] = i
end
local tbl_5_upvr = {}
local WeaponHandler_upvr = require(ReplicatedStorage.TankModules.WeaponHandler)
local loadBar_upvr = Parent_upvr.loadBar
local ShellModules_upvr = require(game.ReplicatedStorage.PHRST.ShellModules)
local TweenService_upvr = game.TweenService
ReplicatedStorage.Events.WeaponStuff.LoaderUIEvent.OnClientEvent:Connect(function(arg1, arg2, arg3) -- Line 36
	--[[ Upvalues[11]:
		[1]: tbl_5_upvr (readonly)
		[2]: tbl_6_upvw (read and write)
		[3]: Parent_upvr (readonly)
		[4]: WeaponHandler_upvr (readonly)
		[5]: LocalPlayer_upvr (readonly)
		[6]: Notification_upvr (readonly)
		[7]: tbl_4_upvr (readonly)
		[8]: loadBar_upvr (readonly)
		[9]: ShellModules_upvr (readonly)
		[10]: TweenService_upvr (readonly)
		[11]: var10_upvw (read and write)
	]]
	if arg1 == "initiate" then
		local ReloadEvent_upvr = arg2:FindFirstChild("ReloadEvent")
		if ReloadEvent_upvr == nil then
			warn("Incorrect Weapon Data!")
		else
			if arg2:GetAttribute("RackSorting") then
				local _ = "mainonly"
			else
			end
			if tbl_5_upvr[arg2] ~= nil then
				warn("Loading data for this weapon already exists")
				return
			end
			for _, v_6 in require(game.ReplicatedFirst.Shells.Modules:FindFirstChild(arg2.Name)).AmmoTypes do
				table.insert({}, v_6)
				local var50
			end
			table.sort(var50, function(arg1_2, arg2_2) -- Line 61
				--[[ Upvalues[1]:
					[1]: tbl_6_upvw (copied, read and write)
				]]
				local var52 = tbl_6_upvw[arg2_2.ShellType]
				if (tbl_6_upvw[arg1_2.ShellType] or 10) >= (var52 or 10) then
					var52 = false
				else
					var52 = true
				end
				return var52
			end)
			for _, _ in tbl_5_upvr do
				local var53
			end
			local tbl_9 = {}
			local tbl_8_upvr = {}
			local tbl_7 = {}
			local clone_3_upvr = script.FrameExample:Clone()
			clone_3_upvr.Parent = Parent_upvr
			table.insert(tbl_8_upvr, clone_3_upvr)
			clone_3_upvr.ZIndex = var53
			if arg2.CurrentlyLoaded.Value ~= "Unloaded" then
				clone_3_upvr.Visible = false
			elseif WeaponHandler_upvr.depleteAmmoGroup(arg2, false, true) then
				clone_3_upvr.Visible = true
			end
			local var58_upvr
			local function _() -- Line 98, Named "active"
				--[[ Upvalues[4]:
					[1]: arg2 (readonly)
					[2]: clone_3_upvr (readonly)
					[3]: WeaponHandler_upvr (copied, readonly)
					[4]: var58_upvr (readonly)
				]]
				if arg2.CurrentlyLoaded.Value ~= "Unloaded" then
					clone_3_upvr.Visible = false
				elseif WeaponHandler_upvr.depleteAmmoGroup(arg2, false, true, var58_upvr) then
					clone_3_upvr.Visible = true
				end
			end
			table.insert(tbl_9, arg2.CurrentlyLoaded:GetPropertyChangedSignal("Value"):Connect(function() -- Line 106
				--[[ Upvalues[4]:
					[1]: arg2 (readonly)
					[2]: clone_3_upvr (readonly)
					[3]: WeaponHandler_upvr (copied, readonly)
					[4]: var58_upvr (readonly)
				]]
				if arg2.CurrentlyLoaded.Value ~= "Unloaded" then
					clone_3_upvr.Visible = false
				elseif WeaponHandler_upvr.depleteAmmoGroup(arg2, false, true, var58_upvr) then
					clone_3_upvr.Visible = true
				end
			end))
			local CurrentRockets_upvr = arg2:FindFirstChild("CurrentRockets")
			if CurrentRockets_upvr then
				table.insert(tbl_9, CurrentRockets_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 112
					--[[ Upvalues[3]:
						[1]: CurrentRockets_upvr (readonly)
						[2]: arg2 (readonly)
						[3]: clone_3_upvr (readonly)
					]]
					if 0 < CurrentRockets_upvr.Value and arg2.CurrentlyLoaded.Value == "Unloaded" and clone_3_upvr.Visible == false then
						clone_3_upvr.Visible = true
					end
				end))
			else
				table.insert(tbl_9, arg2:GetAttributeChangedSignal("changed"):Connect(function() -- Line 118
					--[[ Upvalues[4]:
						[1]: arg2 (readonly)
						[2]: clone_3_upvr (readonly)
						[3]: WeaponHandler_upvr (copied, readonly)
						[4]: var58_upvr (readonly)
					]]
					if arg2.CurrentlyLoaded.Value ~= "Unloaded" then
						clone_3_upvr.Visible = false
					elseif WeaponHandler_upvr.depleteAmmoGroup(arg2, false, true, var58_upvr) then
						clone_3_upvr.Visible = true
					end
				end))
			end
			for i_8, v_8_upvr in var50 do
				local clone = script.Example:Clone()
				clone.Parent = clone_3_upvr.AmmoContainer
				clone.AmmoName.KeyNumber.Text = i_8
				WeaponHandler_upvr.setAmmoFrameContents(clone, v_8_upvr)
				clone.Activated:Connect(function() -- Line 132
					--[[ Upvalues[6]:
						[1]: LocalPlayer_upvr (copied, readonly)
						[2]: Notification_upvr (copied, readonly)
						[3]: arg2 (readonly)
						[4]: clone_3_upvr (readonly)
						[5]: ReloadEvent_upvr (readonly)
						[6]: v_8_upvr (readonly)
					]]
					if LocalPlayer_upvr.Character == nil or LocalPlayer_upvr.Character ~= nil and LocalPlayer_upvr.Character:GetAttribute("Knocked") then
						Notification_upvr:Fire("ERROR", "Cannot load weapon while incapacitated", 2)
					else
						if arg2:GetAttribute("reloading") then
							Notification_upvr:Fire("ERROR", "Weapon cannot be reloaded at the moment", 2)
							return
						end
						if arg2.CurrentlyLoaded.Value == "Unloaded" then
							clone_3_upvr.Visible = false
							ReloadEvent_upvr:FireServer("Reload", v_8_upvr.DisplayName)
						end
					end
				end)
				if tbl_4_upvr[i_8 + 48] == nil then
					local tbl = {}
					local tbl_3 = {}
					tbl_3.WeaponFolder = arg2
					tbl_3.MainFrameGui = clone_3_upvr
					tbl_3.WeaponEvent = ReloadEvent_upvr
					tbl_3.DispName = v_8_upvr.DisplayName
					tbl_3.OrderNumber = var53
					tbl[1] = tbl_3
					tbl_4_upvr[i_8 + 48] = tbl
				else
					local tbl_2 = {}
					tbl_2.WeaponFolder = arg2
					tbl_2.MainFrameGui = clone_3_upvr
					tbl_2.WeaponEvent = ReloadEvent_upvr
					tbl_2.DispName = v_8_upvr.DisplayName
					tbl_2.OrderNumber = var53
					table.insert(tbl_4_upvr[i_8 + 48], tbl_2)
					table.sort(tbl_4_upvr[i_8 + 48], function(arg1_3, arg2_3) -- Line 169
						local var69
						if arg2_3.OrderNumber >= arg1_3.OrderNumber then
							var69 = false
						else
							var69 = true
						end
						return var69
					end)
				end
				table.insert(tbl_7, i_8 + 48)
			end
			table.insert(tbl_9, ReloadEvent_upvr.OnClientEvent:Connect(function(arg1_4, arg2_4) -- Line 177
				--[[ Upvalues[7]:
					[1]: loadBar_upvr (copied, readonly)
					[2]: ShellModules_upvr (copied, readonly)
					[3]: tbl_8_upvr (readonly)
					[4]: arg3 (readonly)
					[5]: TweenService_upvr (copied, readonly)
					[6]: ReloadEvent_upvr (readonly)
					[7]: var10_upvw (copied, read and write)
				]]
				local clone_2_upvr = script.ExampleFrame:Clone()
				clone_2_upvr.Parent = loadBar_upvr
				clone_2_upvr.WeaponName.Text = arg2_4
				local var72 = ShellModules_upvr.WeaponInfos[arg2_4]
				if var72 ~= nil then
					clone_2_upvr.WeaponName.Text = var72.DisplayName
				end
				table.insert(tbl_8_upvr, clone_2_upvr)
				if arg3 then
					clone_2_upvr.FastReloadWindow.Visible = true
					clone_2_upvr.Progress.Needle.Visible = true
					clone_2_upvr.Progress.BackgroundColor3 = Color3.fromRGB(255, 142, 142)
					clone_2_upvr.FastReloadWindow.Position = UDim2.fromScale(math.random(5, 8) / 10, 0)
					clone_2_upvr.FastReloadWindow.Size = UDim2.fromScale(0.2 / arg1_4, 1)
					clone_2_upvr.ControlsButton.Visible = true
				else
					clone_2_upvr.Progress.BackgroundColor3 = Color3.fromRGB(195, 195, 195)
				end
				clone_2_upvr.Progress.Size = UDim2.fromScale(0, 1)
				local TweenInfo_new_result1 = TweenInfo.new(arg1_4, Enum.EasingStyle.Linear)
				local any_Create_result1_upvr = TweenService_upvr:Create(clone_2_upvr.Progress, TweenInfo_new_result1, {
					Size = UDim2.fromScale(1, 1);
				})
				any_Create_result1_upvr:Play()
				local NumberValue_upvr = Instance.new("NumberValue", clone_2_upvr)
				NumberValue_upvr.Value = arg1_4
				NumberValue_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 207
					--[[ Upvalues[3]:
						[1]: clone_2_upvr (readonly)
						[2]: NumberValue_upvr (readonly)
						[3]: arg3 (copied, readonly)
					]]
					clone_2_upvr.num.Text = string.format("%.1fs", NumberValue_upvr.Value)
					if arg3 then
						if math.abs(clone_2_upvr.Progress.Size.X.Scale - clone_2_upvr.FastReloadWindow.Position.X.Scale) < clone_2_upvr.FastReloadWindow.Size.X.Scale / 2 then
							clone_2_upvr.Progress.Needle.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
							return
						end
						clone_2_upvr.Progress.Needle.BackgroundColor3 = Color3.fromRGB(68, 255, 0)
					end
				end)
				local any_Create_result1_upvw = TweenService_upvr:Create(NumberValue_upvr, TweenInfo_new_result1, {
					Value = 0;
				})
				local var80_upvw = false
				local function quickReload() -- Line 222
					--[[ Upvalues[8]:
						[1]: var80_upvw (read and write)
						[2]: clone_2_upvr (readonly)
						[3]: any_Create_result1_upvr (readonly)
						[4]: any_Create_result1_upvw (read and write)
						[5]: ReloadEvent_upvr (copied, readonly)
						[6]: NumberValue_upvr (readonly)
						[7]: arg1_4 (readonly)
						[8]: TweenService_upvr (copied, readonly)
					]]
					if var80_upvw then
					else
						if math.abs(clone_2_upvr.Progress.Size.X.Scale - clone_2_upvr.FastReloadWindow.Position.X.Scale) < clone_2_upvr.FastReloadWindow.Size.X.Scale / 2 then
							any_Create_result1_upvr:Pause()
							any_Create_result1_upvw:Pause()
							ReloadEvent_upvr:FireServer("QTEReload")
							local var81 = NumberValue_upvr
							var81.Value -= arg1_4 * 0.2
							any_Create_result1_upvw = TweenService_upvr:Create(NumberValue_upvr, TweenInfo.new(NumberValue_upvr.Value, Enum.EasingStyle.Linear), {
								Value = 0;
							})
							any_Create_result1_upvw:Play()
							TweenService_upvr:Create(clone_2_upvr.Progress, TweenInfo.new(math.max(NumberValue_upvr.Value, 0.1), Enum.EasingStyle.Linear), {
								Size = UDim2.fromScale(1, 1);
							}):Play()
							clone_2_upvr.Progress.BackgroundColor3 = Color3.fromRGB(85, 255, 255)
							clone_2_upvr.FastReloadWindow.Visible = false
							clone_2_upvr.Progress.Needle.Visible = false
							clone_2_upvr.ControlsButton.Visible = false
							TweenService_upvr:Create(clone_2_upvr.Progress, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true), {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							}):Play()
							return
						end
						clone_2_upvr.FastReloadWindow.Visible = false
						clone_2_upvr.Progress.Needle.Visible = false
						clone_2_upvr.ControlsButton.Visible = false
						var80_upvw = true
						task.spawn(function() -- Line 250
							--[[ Upvalues[1]:
								[1]: clone_2_upvr (copied, readonly)
							]]
							local const_number = 0
							while task.wait(0.25) and const_number < 5 do
								if (const_number + 1) % 2 == 0 then
									clone_2_upvr.Progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								else
									clone_2_upvr.Progress.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
								end
							end
							clone_2_upvr.Progress.BackgroundColor3 = Color3.fromRGB(255, 142, 142)
						end)
					end
				end
				if arg3 then
					var10_upvw = quickReload
				end
				clone_2_upvr.ControlsButton.Activated:Connect(quickReload)
				any_Create_result1_upvw:Play()
				while clone_2_upvr:FindFirstChild("Progress") and clone_2_upvr.Progress.Size.X.Scale < 1 and clone_2_upvr.Parent do
					task.wait()
				end
				if clone_2_upvr and clone_2_upvr.Parent then
					NumberValue_upvr.Value = 0
					TweenService_upvr:Create(clone_2_upvr.Progress, TweenInfo.new(0.5), {
						BackgroundColor3 = Color3.fromRGB(85, 255, 85);
					}):Play()
					task.wait(0.5)
					clone_2_upvr:Destroy()
				end
			end))
			tbl_5_upvr[arg2] = {
				Connections = tbl_9;
				Frames = tbl_8_upvr;
				KeyCodes = tbl_7;
			}
		end
	end
	if arg1 == "leave" then
		ReloadEvent_upvr = print
		ReloadEvent_upvr("disconnect")
		ReloadEvent_upvr = tbl_5_upvr[arg2]
		local var89 = ReloadEvent_upvr
		if var89 == nil then
			var58_upvr = "No data in registry"
			warn(var58_upvr)
		else
			var58_upvr = nil
			tbl_5_upvr[arg2] = var58_upvr
		end
		var58_upvr = nil
		for _, v_2 in var89.Connections, var58_upvr do
			v_2:Disconnect()
		end
		var58_upvr = nil
		for _, v_3 in var89.Frames, var58_upvr do
			v_3:Destroy()
		end
		var58_upvr = nil
		for _, v_4 in var89.KeyCodes, var58_upvr do
			local var90 = tbl_4_upvr[v_4]
			if var90 ~= nil then
				tbl_8_upvr = nil
				for i_5, v_5 in var90, tbl_8_upvr do
					if v_5[1] == arg2 then
						var90[i_5] = nil
					end
				end
				tbl_8_upvr = nil
				tbl_4_upvr[v_4] = tbl_8_upvr
			end
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(arg1, arg2) -- Line 323
	--[[ Upvalues[4]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var10_upvw (read and write)
		[3]: tbl_4_upvr (readonly)
		[4]: Notification_upvr (readonly)
	]]
	if arg2 then
	else
		if arg1.KeyCode == Enum.KeyCode.E and var10_upvw then
			var10_upvw()
		end
		local var94 = tbl_4_upvr[arg1.KeyCode.Value]
		if var94 ~= nil then
			if LocalPlayer_upvr.Character == nil or LocalPlayer_upvr.Character ~= nil and LocalPlayer_upvr.Character:GetAttribute("Knocked") then
				Notification_upvr:Fire("ERROR", "Cannot load weapon while incapacitated", 2)
				return
			end
			print(var94)
			for _, v_9 in var94 do
				if v_9.WeaponFolder:FindFirstChild("CurrentlyLoaded") and v_9.WeaponFolder.CurrentlyLoaded.Value == "Unloaded" and v_9.MainFrameGui.Visible then
					if v_9.WeaponFolder:GetAttribute("reloading") then
						Notification_upvr:Fire("ERROR", "Weapon cannot be reloaded at the moment", 2)
					else
						print(v_9.MainFrameGui)
						v_9.MainFrameGui.Visible = false
						print(v_9.MainFrameGui.Parent)
						v_9.WeaponEvent:FireServer("Reload", v_9.DispName)
					end
				end
			end
		end
	end
end)
