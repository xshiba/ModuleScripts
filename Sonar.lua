local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ModuleScriptLoader_0 = loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/ModuleScripts/refs/heads/main/ModuleScriptLoader.lua'))();
local l_ReplicationUtils_0 = loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/ModuleScripts/refs/heads/main/ReplicationUtils.lua'))();
if l_RunService_0:IsServer() and l_RunService_0:IsClient() or not l_RunService_0:IsRunning() then
    if l_RunService_0:IsRunning() then
        warn("Warning: Loading all modules in PlaySolo. It's recommended you use accurate play solo.");
    end;
    local v6 = l_ModuleScriptLoader_0.new({
        l_ReplicationUtils_0.ScriptType.SHARED, 
        l_ReplicationUtils_0.ScriptType.SERVER, 
        l_ReplicationUtils_0.ScriptType.CLIENT
    });
    v6:AddModulesFromParent(l_ServerScriptService_0:WaitForChild("Sonar"));
    return v6;
elseif l_RunService_0:IsServer() then
    local v7 = l_ReplicationUtils_0.createReplicationFolder("_replicationFolder");
    local v8 = l_ModuleScriptLoader_0.new({
        l_ReplicationUtils_0.ScriptType.SHARED, 
        l_ReplicationUtils_0.ScriptType.SERVER
    }, {
        [l_ReplicationUtils_0.ScriptType.CLIENT] = v7, 
        [l_ReplicationUtils_0.ScriptType.SHARED] = v7
    });
    v8:AddModulesFromParent(l_ServerScriptService_0:WaitForChild("Sonar"));
    if l_ServerScriptService_0:FindFirstChild("Library") then
        v8:AddModulesFromParent(l_ServerScriptService_0.Library);
    end;
    if l_ServerScriptService_0:FindFirstChild("WorldModules") then
        v8:AddModulesFromParent(l_ServerScriptService_0.WorldModules);
    end;
    l_CollectionService_0:AddTag(workspace, "ModulesReplicated");
    return v8;
elseif l_RunService_0:IsClient() then
    local v9 = l_ModuleScriptLoader_0.new({
        l_ReplicationUtils_0.ScriptType.SHARED, 
        l_ReplicationUtils_0.ScriptType.CLIENT
    });
    v9:AddModulesFromParent(l_ReplicatedStorage_0:WaitForChild("_replicationFolder"));
    return v9;
else
    error("Error: Unknown state");
    return;
end;
