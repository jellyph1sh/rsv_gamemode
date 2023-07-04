RegisterCommand("serverid", function(src)
    if (src > 0) then
        exports.rsv_utils:SendChatMessage(src, {"ID:", src}, { 255, 255, 255 })
    else
        print("This command can be used by players only!")
    end
end, false)

RegisterCommand("revive", function(src, args)
    if (#args == 0) then
        TriggerClientEvent("jph_gamemode:revive", src)
        exports.rsv_utils:SendChatMessage(src, {"You revive yourself!"}, {0, 255, 0})
        return
    elseif (#args > 1) then
        exports.rsv_utils:SendChatMessage(src, {"Please insert only one argument."}, {255, 0, 0})
        return
    end
    targetSrc = tonumber(args[1])
    if (targetSrc) then
        TriggerClientEvent("jph_gamemode:revive", targetSrc)
        exports.rsv_utils:SendChatMessage(src, {"You revive", targetSrc, "!"}, {0, 255, 0})
        return
    end
end, true)