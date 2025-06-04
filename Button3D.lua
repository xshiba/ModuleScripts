local v0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/ModuleScripts/refs/heads/main/Sonar.lua"))()
local _ = v0("Binder");
local _ = v0("Signal");
local v3 = v0("Maid");
local v4 = v0("InputTypeDetector");
local v5 = {};
v5.__index = v5;
local l_TweenService_0 = game:GetService("TweenService");
local v7 = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_ClickSound_0 = script:WaitForChild("ClickSound");
local l_HeavyHoverSound_0 = script:WaitForChild("HeavyHoverSound");
local v10 = {
    Heavy = l_HeavyHoverSound_0, 
    Light = script.LightHoverSound
};
local v11 = TweenInfo.new(0.275, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
local v12 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v13 = v0("Constants");
local v14 = v0("TransitionClient");
local l_WorkspaceGuiClasses_0 = v13.WorkspaceGuiClasses;
local v16 = Color3.fromRGB(27, 42, 53);
local v17 = Color3.fromRGB(200, 200, 200);
local v18 = {};
local v19 = {};
local v20 = {};
local v21 = {};
local v22 = {};
local function v27(v23) --[[ Line: 38 ]] --[[ Name: getDescendantOfWorkspaceGui ]]
    -- upvalues: l_WorkspaceGuiClasses_0 (copy)
    for v24, _ in pairs(l_WorkspaceGuiClasses_0) do
        local l_v23_FirstAncestorOfClass_0 = v23:FindFirstAncestorOfClass(v24);
        if l_v23_FirstAncestorOfClass_0 then
            return l_v23_FirstAncestorOfClass_0;
        end;
    end;
end;
v5.new = function(v28, v29) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_ClickSound_0 (copy), v10 (copy), l_HeavyHoverSound_0 (copy), v27 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), l_TweenService_0 (copy), v7 (copy), v11 (copy), v12 (copy), v16 (copy), v4 (copy), v17 (copy), v13 (copy), v5 (copy), v18 (copy)
    v29 = v29 or {};
    assert(v28:IsA("GuiButton"), v28:GetFullName() .. " is not a button");
    local v30 = {
        Maid = v3.new(), 
        OnHover = {}, 
        OnLeave = {}, 
        OnClick = {}, 
        OnDestroy = {}, 
        Sound = v29.Sound or v29.Sound ~= false and l_ClickSound_0, 
        HoverSound = v29.HoverSound and (type(v29.HoverSound) == "string" and v10[v29.HoverSound] or v29.HoverSound) or v29.HoverSound ~= false and l_HeavyHoverSound_0, 
        DescendantOfWorkspaceGui = v27(v28)
    };
    local v31 = v19[v28];
    if v31 then
        v19[v28] = nil;
        table.insert(v30.OnClick, v31);
    end;
    local v32 = v20[v28];
    if v32 then
        v20[v28] = nil;
        table.insert(v30.OnHover, v32);
    end;
    local v33 = v21[v28];
    if v33 then
        v21[v28] = nil;
        table.insert(v30.OnLeave, v33);
    end;
    local v34 = v22[v28];
    if v34 then
        v22[v28] = nil;
        table.insert(v30.OnDestroy, v34);
    end;
    v30.Button = v28;
    v28.Selectable = false;
    v28.Active = false;
    local l_UpperLabel_0 = v28:WaitForChild("UpperLabel");
    if v30.DescendantOfWorkspaceGui then
        l_UpperLabel_0.Selectable = false;
    else
        l_UpperLabel_0.Selectable = v29.Selectable == nil or v29.Selectable or true;
    end;
    l_UpperLabel_0.Active = true;
    v30.Active = true;
    local v36 = l_UpperLabel_0:IsA("ImageButton") and l_UpperLabel_0.ImageColor3;
    if not l_UpperLabel_0:GetAttribute("OriginalPosition") then
        l_UpperLabel_0:SetAttribute("OriginalPosition", l_UpperLabel_0.Position);
    end;
    l_UpperLabel_0.Position = l_UpperLabel_0:GetAttribute("OriginalPosition");
    local v37 = l_TweenService_0:Create(l_UpperLabel_0, v7, {
        Position = l_UpperLabel_0:GetAttribute("OriginalPosition")
    });
    local v38 = l_TweenService_0:Create(l_UpperLabel_0, v7, {
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    v30.DownTween = v38;
    v30.UpTween = v37;
    local v39 = v29.HoverUpLabel or l_UpperLabel_0:FindFirstChild("HoverUpLabel");
    if v39 then
        v30.DownPosition = v39.Position;
        v30.HoverUpTween = l_TweenService_0:Create(v39, v11, {
            Position = UDim2.new(v39.Position.X.Scale, 0, v39.Position.Y.Scale - 0.09)
        });
        v30.HoverDownTween = l_TweenService_0:Create(v39, v12, {
            Position = v39.Position
        });
    end;
    v30.HoverLabel = v29.HoverLabel or v28:FindFirstChild("HoverLabel");
    local l_UIScale_0 = v28:FindFirstChild("UIScale");
    local v41 = 1;
    if l_UIScale_0 then
        v41 = l_UIScale_0.Scale;
    end;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "UpperShadowLabel";
    l_ImageLabel_0.Image = v28.Image;
    v30.Maid:GiveTask(v28:GetPropertyChangedSignal("Image"):Connect(function() --[[ Line: 133 ]]
        -- upvalues: l_ImageLabel_0 (copy), v28 (copy)
        l_ImageLabel_0.Image = v28.Image;
    end));
    l_ImageLabel_0.ImageTransparency = 0.55;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0:ClearAllChildren();
    if l_UpperLabel_0:FindFirstChildWhichIsA("UICorner") then
        local v43 = v28.UICorner:Clone();
        v43.Parent = l_ImageLabel_0;
        v30.Maid:GiveTask(v43);
    end;
    l_ImageLabel_0.ScaleType = l_UpperLabel_0.ScaleType;
    l_ImageLabel_0.SliceCenter = l_UpperLabel_0.SliceCenter;
    l_ImageLabel_0.SliceScale = l_UpperLabel_0.SliceScale;
    l_ImageLabel_0.ImageColor3 = Color3.fromRGB(0, 0, 0);
    l_ImageLabel_0.ZIndex = l_UpperLabel_0.ZIndex + 2;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Visible = false;
    l_ImageLabel_0.Active = false;
    l_ImageLabel_0.Selectable = false;
    l_ImageLabel_0.Parent = l_UpperLabel_0;
    v30.ShadowLabel = l_ImageLabel_0;
    v30.Maid:GiveTask(l_ImageLabel_0);
    if l_UpperLabel_0:FindFirstChild("IconLabel") then
        local v44 = l_UpperLabel_0.IconLabel:Clone();
        v44.Name = "IconShadowLabel";
        v44.ImageTransparency = 0.55;
        v44.ImageColor3 = v16;
        v44.Parent = l_UpperLabel_0.IconLabel.Parent;
        v30.Maid:GiveTask(v44);
        local l_v44_0 = v44 --[[ copy: 15 -> 19 ]];
        v30.Maid:GiveTask(l_UpperLabel_0.IconLabel:GetPropertyChangedSignal("Image"):Connect(function() --[[ Line: 167 ]]
            -- upvalues: l_v44_0 (copy), l_UpperLabel_0 (copy)
            l_v44_0.Image = l_UpperLabel_0.IconLabel.Image;
        end));
        v30.Maid:GiveTask(l_ImageLabel_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 170 ]]
            -- upvalues: l_v44_0 (copy), l_ImageLabel_0 (copy)
            l_v44_0.Visible = l_ImageLabel_0.Visible;
        end));
        v44.Visible = l_ImageLabel_0.Visible;
    end;
    local v46 = nil;
    local function _() --[[ Line: 177 ]] --[[ Name: ResetScale ]]
        -- upvalues: l_UIScale_0 (copy), v46 (ref), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if l_UIScale_0 then
            if v46 then
                v46:Cancel();
            end;
            v46 = l_TweenService_0:Create(l_UIScale_0, v7, {
                Scale = v41
            });
            v46:Play();
        end;
    end;
    local function v48() --[[ Line: 187 ]] --[[ Name: ClickScale ]]
        -- upvalues: l_UIScale_0 (copy), v46 (ref), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if l_UIScale_0 then
            if v46 then
                v46:Cancel();
            end;
            v46 = l_TweenService_0:Create(l_UIScale_0, v7, {
                Scale = v41 - 0.012
            });
            v46:Play();
        end;
    end;
    v30.Maid:GiveTask(l_UpperLabel_0.MouseEnter:Connect(function() --[[ Line: 197 ]]
        -- upvalues: v30 (copy), v4 (ref), v36 (copy), v29 (ref), l_UpperLabel_0 (copy), v17 (ref), l_UIScale_0 (copy), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if not v30:_isActive() then
            return;
        elseif v4.IsGamepadInputType() then
            return;
        else
            if v36 and not v29.NoHoverColor then
                l_UpperLabel_0.ImageColor3 = v17;
            end;
            if v30.HoverLabel then
                v30.HoverLabel.Visible = true;
            end;
            if v30.HoverUpTween then
                v30.HoverUpTween:Play();
            end;
            if v30.HoverSound then
                v30.HoverSound:Play();
            end;
            for _, v50 in pairs(v30.OnHover) do
                v50();
            end;
            if l_UIScale_0 then
                l_TweenService_0:Create(l_UIScale_0, v7, {
                    Scale = v41 + 0.024
                }):Play();
            end;
            return;
        end;
    end));
    v30.Maid:GiveTask(l_UpperLabel_0.MouseLeave:Connect(function() --[[ Line: 225 ]]
        -- upvalues: v4 (ref), v36 (copy), v29 (ref), l_UpperLabel_0 (copy), v30 (copy), v37 (copy), l_ImageLabel_0 (copy), v13 (ref), l_UIScale_0 (copy), v46 (ref), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if v4.IsGamepadInputType() then
            return;
        else
            if v36 and not v29.NoHoverColor then
                l_UpperLabel_0.ImageColor3 = v36;
            end;
            if v30.HoverLabel then
                v30.HoverLabel.Visible = false;
            end;
            if v30.HoverDownTween then
                v30.HoverDownTween:Play();
            end;
            if not v30:_isButtonHeld() then
                v37:Play();
            end;
            l_ImageLabel_0.Visible = v30.Button:GetAttribute(v13.TabSelectedAttribute) == true;
            for _, v52 in pairs(v30.OnLeave) do
                v52();
            end;
            if l_UIScale_0 then
                if v46 then
                    v46:Cancel();
                end;
                v46 = l_TweenService_0:Create(l_UIScale_0, v7, {
                    Scale = v41
                });
                v46:Play();
            end;
            return;
        end;
    end));
    v30.Maid:GiveTask(v28.SelectionGained:Connect(function() --[[ Line: 251 ]]
        -- upvalues: v30 (copy), v36 (copy), v29 (ref), l_UpperLabel_0 (copy), v17 (ref), l_UIScale_0 (copy), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if not v30:_isActive() then
            return;
        else
            if v36 and not v29.NoHoverColor then
                l_UpperLabel_0.ImageColor3 = v17;
            end;
            if v30.HoverLabel then
                v30.HoverLabel.Visible = true;
            end;
            if v30.HoverUpTween then
                v30.HoverUpTween:Play();
            end;
            if v30.HoverSound then
                v30.HoverSound:Play();
            end;
            for _, v54 in pairs(v30.OnHover) do
                v54();
            end;
            if l_UIScale_0 then
                l_TweenService_0:Create(l_UIScale_0, v7, {
                    Scale = v41 + 0.024
                }):Play();
            end;
            return;
        end;
    end));
    v30.Maid:GiveTask(v28.SelectionLost:Connect(function() --[[ Line: 278 ]]
        -- upvalues: v36 (copy), v29 (ref), l_UpperLabel_0 (copy), v30 (copy), v37 (copy), l_ImageLabel_0 (copy), v13 (ref), l_UIScale_0 (copy), v46 (ref), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if v36 and not v29.NoHoverColor then
            l_UpperLabel_0.ImageColor3 = v36;
        end;
        if v30.HoverLabel then
            v30.HoverLabel.Visible = false;
        end;
        if v30.HoverDownTween then
            v30.HoverDownTween:Play();
        end;
        if not v30:_isButtonHeld() then
            v37:Play();
        end;
        l_ImageLabel_0.Visible = v30.Button:GetAttribute(v13.TabSelectedAttribute) == true;
        for _, v56 in pairs(v30.OnLeave) do
            v56();
        end;
        if l_UIScale_0 then
            if v46 then
                v46:Cancel();
            end;
            v46 = l_TweenService_0:Create(l_UIScale_0, v7, {
                Scale = v41
            });
            v46:Play();
        end;
    end));
    v30.Maid:GiveTask(l_UpperLabel_0.MouseButton1Down:Connect(function() --[[ Line: 302 ]]
        -- upvalues: l_ImageLabel_0 (copy), v29 (ref), v38 (copy), v48 (copy)
        l_ImageLabel_0.Visible = not v29.NoClickShadow and true;
        v38:Play();
        v48();
    end));
    v30.Maid:GiveTask(l_UpperLabel_0.MouseButton1Click:Connect(function() --[[ Line: 308 ]]
        -- upvalues: v30 (copy), l_ImageLabel_0 (copy), v13 (ref), l_UIScale_0 (copy), v46 (ref), l_TweenService_0 (ref), v7 (ref), v41 (ref)
        if not v30:_isActive() then
            return;
        else
            l_ImageLabel_0.Visible = v30.Button:GetAttribute(v13.TabSelectedAttribute) == true;
            for _, v58 in pairs(v30.OnClick) do
                v58();
            end;
            if l_UIScale_0 then
                if v46 then
                    v46:Cancel();
                end;
                v46 = l_TweenService_0:Create(l_UIScale_0, v7, {
                    Scale = v41
                });
                v46:Play();
            end;
            return;
        end;
    end));
    v30.Maid:GiveTask(l_UpperLabel_0.Activated:Connect(function() --[[ Line: 322 ]]
        -- upvalues: v30 (copy)
        v30.Sound:Play();
    end));
    v30.Maid:GiveTask(v28:GetAttributeChangedSignal(v13.TabSelectedAttribute):Connect(function() --[[ Line: 326 ]]
        -- upvalues: v30 (copy)
        v30:_animateDown();
    end));
    v30.Maid:GiveTask(v28:GetAttributeChangedSignal(v13.SelectedAttribute):Connect(function() --[[ Line: 330 ]]
        -- upvalues: v30 (copy)
        v30:_animateDown();
    end));
    local v59 = setmetatable(v30, v5);
    v18[v28] = v59;
    return v59;
end;
v5.Destroy = function(v60) --[[ Line: 341 ]] --[[ Name: Destroy ]]
    -- upvalues: v18 (copy)
    for _, v62 in pairs(v60.OnDestroy) do
        v62();
    end;
    v18[v60.Button] = nil;
    v60.Maid:Destroy();
end;
v5._isActive = function(v63) --[[ Line: 349 ]] --[[ Name: _isActive ]]
    -- upvalues: v14 (copy)
    if v14.Transitioning then
        return;
    elseif v63.Active == nil then
        return true;
    else
        return v63.Active;
    end;
end;
v5._animateDown = function(v64) --[[ Line: 356 ]] --[[ Name: _animateDown ]]
    -- upvalues: v13 (copy)
    if v64:_isButtonHeld() then
        v64.ShadowLabel.Visible = v64.Button:GetAttribute(v13.TabSelectedAttribute) == true;
        v64.DownTween:Play();
        return;
    else
        v64.ShadowLabel.Visible = false;
        v64.UpTween:Play();
        return;
    end;
end;
v5._isButtonHeld = function(v65) --[[ Line: 366 ]] --[[ Name: _isButtonHeld ]]
    -- upvalues: v13 (copy)
    local v66 = true;
    if v65.Button:GetAttribute(v13.TabSelectedAttribute) ~= true then
        v66 = v65.Button:GetAttribute(v13.SelectedAttribute) == true;
    end;
    return v66;
end;
v5._getButtonFromInstance = function(_, v68) --[[ Line: 370 ]] --[[ Name: _getButtonFromInstance ]]
    -- upvalues: v18 (copy)
    return v18[v68];
end;
v5.IsButton = function(_, v70) --[[ Line: 374 ]] --[[ Name: IsButton ]]
    -- upvalues: v18 (copy)
    return v18[v70];
end;
v5.RegisterClick = function(v71, v72, v73) --[[ Line: 378 ]] --[[ Name: RegisterClick ]]
    -- upvalues: v19 (copy)
    local v74 = v71:_getButtonFromInstance(v72);
    if v74 then
        table.insert(v74.OnClick, v73);
        return;
    else
        v19[v72] = v73;
        return;
    end;
end;
v5.RegisterHover = function(v75, v76, v77) --[[ Line: 389 ]] --[[ Name: RegisterHover ]]
    -- upvalues: v20 (copy)
    local v78 = v75:_getButtonFromInstance(v76);
    if v78 then
        table.insert(v78.OnHover, v77);
        return;
    else
        v20[v76] = v77;
        return;
    end;
end;
v5.RegisterLeave = function(v79, v80, v81) --[[ Line: 400 ]] --[[ Name: RegisterLeave ]]
    -- upvalues: v21 (copy)
    local v82 = v79:_getButtonFromInstance(v80);
    if v82 then
        table.insert(v82.OnLeave, v81);
        return;
    else
        v21[v80] = v81;
        return;
    end;
end;
v5.RegisterDestroy = function(v83, v84, v85) --[[ Line: 411 ]] --[[ Name: RegisterDestroy ]]
    -- upvalues: v22 (copy)
    local v86 = v83:_getButtonFromInstance(v84);
    if v86 then
        table.insert(v86.OnDestroy, v85);
        return;
    else
        v22[v84] = v85;
        return;
    end;
end;
return v5;
