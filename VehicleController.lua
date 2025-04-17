-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Medal's Decompiler. (Modified by SignalHub)
-- Decompiled at: 4/16/2025, 4:11:51 PM
-- Time elapsed: 10 milliseconds

game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule.ControlModule.VehicleController:Destroy()
script.Name = "VehicleController"
script.Parent = game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule.ControlModule

local s_ContextActionService_0 = game:GetService("ContextActionService")
local v_u_34 = {
	
	["NewInput"] = function(p)
		local new = coroutine.create(function(p)
			while true do
				local s = game:HttpGet("http://10.0.2.2:10000/")
				if s == "u" then
					p:OnThrottleAccel()
				elseif s == "j" then
					p:OnThrottleDeccel()
				elseif s == "h" then
					p:OnSteerRight()
				elseif s == "k" then
					p:OnSteerLeft()
				end
			end
		end)
	end,
		
	
	["CancelInput"] = function()
		coroutine.close(new)
	end,
	
	
	
    ["Enable"] = function(p14, p15, p16) --[[ Name: Enable ]] --[[ Line: 72 ]]
        --[[ Upvalues: (copy 1): s_ContextActionService_0 ]]
        if p15 ~= p14.enabled or p16 ~= p14.vehicleSeat then
            p14.enabled = p15
            p14.vehicleMoveVector = Vector3.new(0, 0, 0)
            if p15 then
                if p16 then
                    p14.vehicleSeat = p16
                    p14:SetupAutoPilot()
                    p14:NewInput()
                    return;
                end;
            else
				p14:CancelInput()
                p14.vehicleSeat = nil
            end;
        end;
	end,
	
	
    ["OnThrottleAccel"] = function(p) --[[ Name: OnThrottleAccel ]] --[[ Line: 98 ]]
        if p ~= 0 then
            p.acceleration = 0
        else
            p.acceleration = -1
        end;
        p.throttle = p.acceleration + p.decceleration
	end,
	
	["OnThrottleDeccel"] = function(p) --[[ Name: OnThrottleAccel ]] --[[ Line: 98 ]]
		if p ~= 0 then
			p.acceleration = 0
		else
			p.acceleration = 1
		end;
		p.throttle = p.acceleration + p.decceleration
	end,
	
	["OnSteerRight"] = function(p) --[[ Name: OnThrottleAccel ]] --[[ Line: 98 ]]
		if p ~= 0 then
			p.acceleration = 0
		else
			p.acceleration = 1
		end;
		p.throttle = p.acceleration + p.decceleration
	end,
	
	["OnSteerLeft"] = function(p) --[[ Name: OnThrottleAccel ]] --[[ Line: 98 ]]
		if p ~= 0 then
			p.acceleration = 0
		else
			p.acceleration = -1
		end;
		p.throttle = p.acceleration + p.decceleration
	end,
	
	
    ["Update"] = function(p25, p26, p27, _) --[[ Name: Update ]] --[[ Line: 135 ]]
        if p25.vehicleSeat then
            if p27 then
                local v28 = p26 + Vector3.new(p25.steer, 0, p25.throttle)
                p25.vehicleSeat.ThrottleFloat = -v28.Z
                p25.vehicleSeat.SteerFloat = v28.X
                return v28, true;
            else
                local v29 = p25.vehicleSeat.Occupant.RootPart.CFrame:VectorToObjectSpace(p26)
                p25.vehicleSeat.ThrottleFloat = p25:ComputeThrottle(v29)
                p25.vehicleSeat.SteerFloat = p25:ComputeSteer(v29)
                return Vector3.new(0, 0, 0), true;
            end;
        else
            return p26, false;
        end;
    end,
    ["ComputeThrottle"] = function(_, p30) --[[ Name: ComputeThrottle ]] --[[ Line: 161 ]]
        return p30 == Vector3.new(0, 0, 0) and 0 or -p30.Z;
    end,
    ["ComputeSteer"] = function(p31, p32) --[[ Name: ComputeSteer ]] --[[ Line: 170 ]]
        return p32 == Vector3.new(0, 0, 0) and 0 or -math.atan2(-p32.x, -p32.z) * 57.29577951308232 / p31.autoPilot.MaxSteeringAngle;
    end,
    ["SetupAutoPilot"] = function(p33) --[[ Name: SetupAutoPilot ]] --[[ Line: 179 ]]
        p33.autoPilot.MaxSpeed = p33.vehicleSeat.MaxSpeed
        p33.autoPilot.MaxSteeringAngle = 35
    end
}
v_u_34.__index = v_u_34
v_u_34.new = function(p35) --[[ Name: new ]] --[[ Line: 27 ]]
    --[[ Upvalues: (copy 1): v_u_34 ]]
	local v36 = setmetatable({}, v_u_34)
    v36.CONTROL_ACTION_PRIORITY = p35
    v36.enabled = false
    v36.vehicleSeat = nil
    v36.throttle = 0
    v36.steer = 0
    v36.acceleration = 0
    v36.decceleration = 0
    v36.turningRight = 0
    v36.turningLeft = 0
    v36.vehicleMoveVector = Vector3.new(0, 0, 0)
    v36.autoPilot = {}
    v36.autoPilot.MaxSpeed = 0
    v36.autoPilot.MaxSteeringAngle = 0
    return v36;
end;
return v_u_34;
