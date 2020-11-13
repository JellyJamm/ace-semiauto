--================================--
--        ACE SEMI AUTO v1.0        --
--  by JellyJam (+ Badger)  --
--      License: GNU GPL 3.0      --
--================================--

FullAuto = false
--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(1);
--		TriggerServerEvent("BadgerSemiAuto.getIsAllowed")
--	end
--end)

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("LEOFullAuto:getIsAllowed")
end)

RegisterNetEvent("LEOFullAuto:returnIsAllowed")
AddEventHandler("LEOFullAuto:returnIsAllowed", function(LEOFullAuto)
    FullAuto = LEOFullAuto
end)

-- In your resource, check "allowedToUse" whenever you want to "do" something that needs permissions, for example
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1);
		-- Semi Auto firing
		-- print(allowedToUse)
		while not FullAuto do
			Citizen.Wait(1);
			if (IsControlJustPressed(0, 24)) then 
				--...disable the weapon after the first shot and keep it disabled as long as the trigger is being pulled.
				--once the player lets go of the trigger, the loop will stop and they can pull it again.
				while (IsControlPressed(0, 24) or IsDisabledControlPressed(0, 24)) do 
					DisablePlayerFiring(PlayerId(), true);
					Wait(0);
				end
			end
		end
	end
end)

