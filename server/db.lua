local MySQL = MySQL
local db = {}


local SELECT_ALL_COLLECTABLES= 'SELECT * FROM `collectables`'

function db.selectAllSyncedObjects()
    return  MySQL.query.await(SELECT_ALL_COLLECTABLES) or {}
end

local INSERT_NEW_SYNCED_OBJECT = 'INSERT INTO `collectables` (`model`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `heading`, `iteminfo`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'

function db.insertNewSyncedObject(model, x, y, z, rx, ry, rz, heading, iteminfo)
    return MySQL.prepare.await(INSERT_NEW_SYNCED_OBJECT, { model, x, y, z, rx, ry, rz, heading, iteminfo})
end


local DELETE_SYNCED_OBJECT = 'DELETE FROM `collectables` WHERE `id` = ?'

function db.deleteSyncedObject(id)
    return MySQL.prepare.await(DELETE_SYNCED_OBJECT, { id })
end

local UPDATE_SYNCED_OBJECT = 'UPDATE `collectables` SET `model` = ?, `x` = ?, `y` = ?, `z` = ?, `rx` = ?, `ry` = ?, `rz` = ? WHERE `id` = ?'

function db.updateSyncedObject(model, x, y, z, rx, ry, rz, id)
    return MySQL.prepare.await(UPDATE_SYNCED_OBJECT, { model, x, y, z, rx, ry, rz, id })
end

return db