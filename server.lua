--================================--
--        ACE SEMI AUTO v1.0        --
--  by JellyJam (+ Badger)  --
--      License: GNU GPL 3.0      --
--================================--

RegisterServerEvent("LEOFullAuto:getIsAllowed")
AddEventHandler("LEOFullAuto:getIsAllowed", function()
    if IsPlayerAceAllowed(source, "LEO.FullAuto") then
        TriggerClientEvent("LEOFullAuto:returnIsAllowed", source, true)
    else
        TriggerClientEvent("LEOFullAuto:returnIsAllowed", source, false)
    end
end)
