local db = require 'server.db'
local objects = require 'server.objects'

RegisterNetEvent('rj-collectables:server:newObject', function(data)
    objects.spawnNewObject(data)
end)

RegisterNetEvent('rj-collectables:server:updateObject', function(data)
    objects.updateObject(data)
end)

RegisterNetEvent("rj-collectables:server:removeObject", function(insertId)
    local src = source
    objects.removeObject(insertId, src)
end)

lib.callback.register('rj-collectables:getAllObjects', function(source)
    return ServerObjects
end)


lib.callback.register('rj-collectables:AddItem', function(source, data)
    if not data then return end
    if exports.ox_inventory:CanCarryWeight(source, data.weight*data.count) then
        exports.ox_inventory:AddItem(source, 'collectables_placeholder', data.count, {label = data.label, description = data.description, imageurl = data.imageurl, weight = data.weight*100, type = data.type or nil, model = data.model})
        return true
    end
    return false
end)

lib.callback.register('rj-collectables:RemoveItem', function(source, data)
    exports.ox_inventory:RemoveItem(source, data.name, 1, data.metadata, data.slot)
    return
end)
