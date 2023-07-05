local item = {}
local obj = require 'client.object'

function item.SearchSlot(slot, item)
    local search = exports.ox_inventory:Search('slots', item)
    local iteminfo
    for _, v in pairs(search) do
        if v.slot == slot then
            iteminfo = v
            break
        end
    end
    return iteminfo
end


function item.ItemStuff(data)
    local iteminfo = item.SearchSlot(data.slot, 'collectables_placeholder')
    if iteminfo.metadata.type ~= 'placeable' or not iteminfo.metadata.model then exports.rj-resources:PreventUse() return false end
    return iteminfo
end

return item