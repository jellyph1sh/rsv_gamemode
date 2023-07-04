function SendChatMessage(src, messages, colour)
    TriggerClientEvent("chat:addMessage", src, {
        args = messages,
        color = colour
    })
end

RegisterCommand("serverid", function(src)
    if (src > 0) then
        SendChatMessage(src, {"ID:", src}, { 255, 255, 255 })
    else
        print("This command can be used by players only!")
    end
end, false)

RegisterCommand("revive", function(src, args)
    if (#args == 0) then
        TriggerClientEvent("jph_gamemode:revive", src)
        SendChatMessage(src, {"You revive yourself!"}, {0, 255, 0})
        return
    elseif (#args > 1) then
        SendChatMessage(src, {"Please insert only one argument."}, {255, 0, 0})
        return
    end
    targetSrc = tonumber(args[1])
    if (targetSrc) then
        TriggerClientEvent("jph_gamemode:revive", targetSrc)
        SendChatMessage(src, {"You revive", targetSrc, "!"}, {0, 255, 0})
        return
    end
end, true)