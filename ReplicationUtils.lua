local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = {};
local function v8(v2) --[[ Line: 9 ]] --[[ Name: readonly ]]
    return (setmetatable(v2, {
        __index = function(_, v4) --[[ Line: 11 ]] --[[ Name: __index ]]
            error(("Bad index %q"):format((tostring(v4))), 2);
        end, 
        __newindex = function(_, v6, _) --[[ Line: 14 ]] --[[ Name: __newindex ]]
            error(("Bad index %q"):format((tostring(v6))), 2);
        end
    }));
end;
v1.classifyModuleScriptType = function(v9, v10) --[[ Line: 22 ]] --[[ Name: classifyModuleScriptType ]]
    -- upvalues: v1 (copy)
    if v10 then
        local l_v9_FirstAncestorOfClass_0 = v9:FindFirstAncestorOfClass("ModuleScript");
        if l_v9_FirstAncestorOfClass_0 and l_v9_FirstAncestorOfClass_0:IsDescendantOf(v10) then
            return v1.ScriptType.SUBMODULE;
        end;
    end;
    local l_Parent_0 = v9.Parent;
    while true do
        if l_Parent_0 and l_Parent_0 ~= v10 then
            local l_Name_0 = l_Parent_0.Name;
            if l_Name_0 == "Server" then
                return v1.ScriptType.SERVER;
            elseif l_Name_0 == "Client" then
                return v1.ScriptType.CLIENT;
            else
                l_Parent_0 = l_Parent_0.Parent;
            end;
        else
            return v1.ScriptType.SHARED;
        end;
    end;
end;
v1.reparentModulesOfScriptType = function(v14, v15, v16) --[[ Line: 44 ]] --[[ Name: reparentModulesOfScriptType ]]
    assert(type(v14) == "table");
    assert(type(v15) == "string");
    assert(typeof(v16) == "Instance");
    for _, v18 in pairs(v14[v15]) do
        if v16:FindFirstChild(v18.Name) then
            warn((("Warning: %* could not be reparented because a duplicate name already exists!"):format((v18:GetFullName()))));
        else
            v18.Parent = v16;
        end;
    end;
end;
v1.getReplicationMapForParent = function(v19) --[[ Line: 59 ]] --[[ Name: getReplicationMapForParent ]]
    -- upvalues: v1 (copy)
    assert(typeof(v19) == "Instance");
    local v20 = {
        [v1.ScriptType.SHARED] = {}, 
        [v1.ScriptType.SERVER] = {}, 
        [v1.ScriptType.CLIENT] = {}, 
        [v1.ScriptType.SUBMODULE] = {}
    };
    for _, v22 in pairs(v19:GetDescendants()) do
        if v22:IsA("ModuleScript") then
            table.insert(v20[v1.classifyModuleScriptType(v22, v19)], v22);
        end;
    end;
    return v20;
end;
v1.mergeModuleScriptIntoLookupTable = function(v23, v24, _) --[[ Line: 79 ]] --[[ Name: mergeModuleScriptIntoLookupTable ]]
    if v23[v24.Name] then
        warn((("Warning: %* could not be reparented because a duplicate name already exists!"):format((v24:GetFullName()))));
        return;
    else
        v23[v24.Name] = v24;
        return;
    end;
end;
v1.mergeReplicationMapIntoLookupTable = function(v26, v27, v28) --[[ Line: 87 ]] --[[ Name: mergeReplicationMapIntoLookupTable ]]
    -- upvalues: v1 (copy)
    for _, v30 in pairs(v28) do
        for _, v32 in pairs(v27[v30]) do
            v1.mergeModuleScriptIntoLookupTable(v26, v32, v28);
        end;
    end;
end;
v1.ScriptType = v8({
    SHARED = "shared", 
    SERVER = "server", 
    CLIENT = "client", 
    SUBMODULE = "submodule"
});
v1.isInTable = function(v33, v34) --[[ Line: 102 ]] --[[ Name: isInTable ]]
    assert(v33);
    assert(v34);
    for _, v36 in pairs(v33) do
        if v36 == v34 then
            return true;
        end;
    end;
    return false;
end;
v1.createReplicationFolder = function(v37) --[[ Line: 115 ]] --[[ Name: createReplicationFolder ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    assert(type(v37) == "string");
    assert(not l_ReplicatedStorage_0:FindFirstChild(v37), "Duplicate of _ReplicatedModules");
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = v37;
    l_Folder_0.Parent = l_ReplicatedStorage_0;
    return l_Folder_0;
end;
return v1;
