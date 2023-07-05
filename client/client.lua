local obj = require 'client.object'
local item = require 'client.item'

local function CollectablesMenu(data)
    local input = lib.inputDialog('Collectables', {
        {type = 'input', label = 'Collectable Item Label', placeholder = 'Item Name', required = true},
        {type = 'textarea', label = 'Collectable Item Description', placeholder = 'blah blah blah...', required = true, min = 2, max = 4, autosize = true},
        {type = 'input', label = 'Image Link', placeholder = 'Link', required = true},
        {type = 'number', label = 'Collectable Item Weight', default = 1, required = true, min = 0, max = 1000},
        {type = 'number', label = 'Item Count', default = 1, required = true, min = 1, max = 1000},
        {type = 'input', label = 'Model Name', description = 'Leave this blank if you do not want this item to be placeable', placeholder = 'prop_bench_01a', required = false},
    })
    if not input then return end
    local type_check
    if input[6] ~= '' then type_check = 'placeable' end 
    local add = lib.callback.await('rj-collectables:AddItem', false, {
        label = input[1],
        description = input[2],
        imageurl = input[3],
        weight = input[4],
        type = type_check,
        model = input[6],
        count = input[5],
    })
    if not add then lib.notify({description = 'Pockets full'}) end
end
exports('CollectablesMenu', CollectablesMenu)

RegisterNetEvent('rj-collectables:client:open', function()
    if GetInvokingResource() then return end
    CollectablesMenu()
end)

exports('useitem', function(data)
    local iteminfo = item.ItemStuff(data)
    if iteminfo then
        local object = iteminfo.metadata.model
        local objectModel = object and GetHashKey(object)
        if IsModelInCdimage(objectModel) then
            obj.previewObject(objectModel, object, iteminfo)
        end
    end
end)



