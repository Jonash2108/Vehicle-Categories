-- made by turtlebandit#0001

-- saved vehicles parent

local vehSpawn = menu.get_feature_by_hierarchy_key("spawn.vehicles.saved_vehicles")

-- gets all vehicle categories in moddedVehicles

local vehCats = utils.get_all_sub_directories_in_directory(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\moddedVehicles", ""))

-- 'Better' Spawner tab

local vehParent = menu.add_feature("'Better' Spawner", "parent")

-- All Vehicles tab

local allVeh = menu.add_feature("All Vehicles", "parent", vehParent.id)

-- adds all vehicles to All Vehicles tab

for i = 1, vehSpawn.child_count do
    local child = vehSpawn.children[i]
    if child.name and child.name ~= "Save" then
        menu.add_feature(child.name, "action", allVeh.id, function()
            child:toggle()
        end)
    end
end

-- create categories and adds vehicles to them

if #vehCats then
    for i = 1, #vehCats do
        local cat = vehCats[i]
        local catFeat = menu.add_feature(cat, "parent", vehParent.id)
        local vehs = utils.get_all_files_in_directory(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\moddedVehicles\\" .. cat, ""), "ini")
        if #vehs then
            for i = 1, #vehs do
                local veh = vehs[i]
                local gsubVeh = string.gsub(veh, ".ini", "")
                menu.add_feature(gsubVeh, "action", catFeat.id, function()
                    for i = 1, vehSpawn.child_count do
                        local child = vehSpawn.children[i]
                        if child.name == gsubVeh then
                            child:toggle()
                        end
                    end
                end)
            end
        end
    end
end

-- for i = 1, vehSpawn.child_count do
--     local child = vehSpawn.children[i]
--     if child.name == gsubVeh then
--         child:toggle()
--     end
-- end