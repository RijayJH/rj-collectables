QB = {}
local QBCore = exports['qb-core']:GetCoreObject()

function QB.GetIdentifier(src)
    return QBCore.Functions.GetPlayer(src).PlayerData.metadata['citizenid']
end

return QB