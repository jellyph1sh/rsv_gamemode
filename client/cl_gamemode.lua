function SpawnConnectedPlayer()
    while (not NetworkIsPlayerActive(PlayerId())) do
        Wait(100)
    end
    loc = Config.DefaultLocation
    exports.spawnmanager:spawnPlayer({
        x = loc.x,
        y = loc.y,
        z = loc.z,
        heading = loc.w,
        model = Config.DefaultModel,
        skipFade = false
    }, function(spawn)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetMaxWantedLevel(0)
    end)
end

function Revive()
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(ped))
    NetworkResurrectLocalPlayer(x, y, z, GetEntityHeading(ped), true, true, false)
end

RegisterNetEvent("jph_gamemode:revive")
AddEventHandler("jph_gamemode:revive", Revive)

SpawnConnectedPlayer()
