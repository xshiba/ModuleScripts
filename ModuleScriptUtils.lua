local v0 = {};
local v1 = game:GetService("RunService"):IsServer();
v0.requireByName = function(v2, v3) --[[ Line: 11 ]] --[[ Name: requireByName ]]
    -- upvalues: v1 (copy)
    assert(type(v2) == "function");
    assert(type(v3) == "table");
    return function(v4, v5) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v2 (copy), v3 (copy)
        if v5 == "Server" and not v1 then
            return nil;
        elseif v5 == "Client" and v1 then
            return nil;
        elseif typeof(v4) == "Instance" and v4:IsA("ModuleScript") then
            return v2(v4);
        elseif type(v4) == "string" then
            if v3[v4] then
                return v2(v3[v4]);
            else
                error("Error: Library '" .. tostring(v4) .. "' does not exist.", 2);
                return;
            end;
        else
            error(("Error: module must be a string or ModuleScript, got '%s' for '%s'"):format(typeof(v4), v4.ClassName, (tostring(v4))));
            return;
        end;
    end;
end;
v0.detectCyclicalRequires = function(v6) --[[ Line: 38 ]] --[[ Name: detectCyclicalRequires ]]
    assert(type(v6) == "function");
    local v7 = {};
    local v8 = {};
    return function(v9, ...) --[[ Line: 44 ]]
        -- upvalues: v8 (copy), v6 (copy), v7 (copy)
        assert(typeof(v9) == "Instance");
        if v8[v9] then
            return v6(v9);
        else
            v8[v9] = #v7 + 1;
            table.insert(v7, v9);
            local v10 = v6(v9, ...);
            v8[v9] = nil;
            return v10;
        end;
    end;
end;
v0.getCyclicalStateFromStack = function(v11, v12) --[[ Line: 67 ]] --[[ Name: getCyclicalStateFromStack ]]
    local v13 = "";
    for v14 = v12, #v11 do
        v13 = v13 .. v11[v14].Name .. " -> ";
    end;
    return v13 .. v11[v12].Name;
end;
return v0;
