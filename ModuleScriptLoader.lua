local l_ModuleScriptUtils_0 = loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/ModuleScripts/refs/heads/main/ModuleScriptUtils.lua'))();
local l_ReplicationUtils_0 = loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/ModuleScripts/refs/heads/main/ReplicationUtils.lua'))();
local v2 = {};
v2.new = function(v3, v4) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_ReplicationUtils_0 (copy), l_ModuleScriptUtils_0 (copy)
    local v5 = setmetatable({}, v2);
    v5._loadableScriptTypes = v3 or {
        l_ReplicationUtils_0.ScriptType.SHARED, 
        l_ReplicationUtils_0.ScriptType.SERVER, 
        l_ReplicationUtils_0.ScriptType.CLIENT
    };
    v5._scriptTypeReplicationParentMap = v4 or {};
    v5._lookupTable = {};
    v5._require = l_ModuleScriptUtils_0.requireByName(l_ModuleScriptUtils_0.detectCyclicalRequires(require), v5._lookupTable);
    return v5;
end;
v2.AddModule = function(v6, v7) --[[ Line: 27 ]] --[[ Name: AddModule ]]
    -- upvalues: l_ReplicationUtils_0 (copy)
    local v8 = false;
    if typeof(v7) == "Instance" then
        v8 = v7:IsA("ModuleScript");
    end;
    assert(v8);
    local v9 = l_ReplicationUtils_0.classifyModuleScriptType(v7, nil);
    v8 = false;
    if l_ReplicationUtils_0.isInTable(v6._loadableScriptTypes, v9) then
        l_ReplicationUtils_0.mergeModuleScriptIntoLookupTable(v6._lookupTable, v7);
        v8 = true;
    end;
    if v6._scriptTypeReplicationParentMap[v9] then
        v7.Parent = v6._scriptTypeReplicationParentMap[v9];
        v8 = true;
    end;
    if not v8 then
        warn(("Warning: Added module %q but it was not replicated or added to lookup table"):format(v7:GetFullName()));
    end;
end;
v2.AddModulesFromParent = function(v10, v11) --[[ Line: 51 ]] --[[ Name: AddModulesFromParent ]]
    -- upvalues: l_ReplicationUtils_0 (copy)
    assert(typeof(v11) == "Instance", "Modules must be added from parent");
    local v12 = l_ReplicationUtils_0.getReplicationMapForParent(v11);
    l_ReplicationUtils_0.mergeReplicationMapIntoLookupTable(v10._lookupTable, v12, v10._loadableScriptTypes);
    for v13, v14 in pairs(v10._scriptTypeReplicationParentMap) do
        l_ReplicationUtils_0.reparentModulesOfScriptType(v12, v13, v14);
    end;
end;
v2.__call = function(v15, ...) --[[ Line: 65 ]] --[[ Name: __call ]]
    return v15._require(...);
end;
v2.__index = function(v16, v17) --[[ Line: 69 ]] --[[ Name: __index ]]
    -- upvalues: v2 (copy)
    if v2[v17] then
        return v2[v17];
    else
        return v16._require(v17);
    end;
end;
return v2;
