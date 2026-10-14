
local LoadingTick = os.clock()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bidness1337/GUI-s/refs/heads/main/libraries/brrr.lol/change-log/richard.lua"))()

local Window = Library:Window({
    Name = "richard",
    Size = UDim2.new(0, 550, 0, 475),
    Open = true,
    FontSize = 20,
    showBottomBar = true,
    version = SCRIPT_VERSION,
    darkBackground = false,
    blurBackground = false,
    darkTransparency = 0.5,
    blurSize = 12,
})


Library.Theme.Accent                = Color3.fromHex('ddfbff')
Library.Theme.Text                  = Color3.fromHex('ddfbff')
Library.Theme['Dark Text']          = Color3.fromHex('565656')
Library.Theme.Background            = Color3.fromHex('030303')
Library.Theme['Section Background'] = Color3.fromHex('000000')
Library.Theme['Page Background']    = Color3.fromHex('000000')
Library.Theme['Light Text']         = Color3.fromHex('676767')
Library.Theme['Inline']             = Color3.fromHex('131313')
Library.Theme['Dark Background']    = Color3.fromHex('000000')
Library.Theme.Outline               = Color3.fromHex('1a1a1a')
Library.Theme['Title Color']        = Color3.fromHex('ddfbff')
Library.Theme.Risk                  = Color3.fromHex('ff4d4d')

-- Binds overlay theme entries (hidden from the "theme colors" loop, shown only in the binds popup)
Library.Theme['Binds Header Background']     = Color3.fromHex('000000')
Library.Theme['Binds Header Title']          = Color3.fromHex('ffffff')
Library.Theme['Binds Header Icon']           = Color3.fromHex('0200ff')

Library.Theme['Binds Row Background']        = Color3.fromHex('ffffff')
Library.Theme['Binds Row Name']              = Color3.fromHex('ffffff')
Library.Theme['Binds Row Key']               = Color3.fromHex('ffffff')
Library.Theme['Binds Row Mode']              = Color3.fromHex('ffffff')

Library.Theme['Binds Row Active Background'] = Color3.fromHex('ffffff')
Library.Theme['Binds Row Active Name']       = Color3.fromHex('ffffff')
Library.Theme['Binds Row Active Key']        = Color3.fromHex('ffffff')
Library.Theme['Binds Row Active Mode']       = Color3.fromHex('ffffff')

Library.Theme['Binds Text Outline']          = Color3.fromHex('000000')

-- Hide these from the auto-generated theme colorpicker list
Library.HiddenThemeKeys = {
    ['Binds Header Background']     = true,
    ['Binds Header Title']          = true,
    ['Binds Header Icon']           = true,
    ['Binds Row Background']        = true,
    ['Binds Row Name']              = true,
    ['Binds Row Key']               = true,
    ['Binds Row Mode']              = true,
    ['Binds Row Active Background'] = true,
    ['Binds Row Active Name']       = true,
    ['Binds Row Active Key']        = true,
    ['Binds Row Active Mode']       = true,
    ['Binds Text Outline']          = true,
}

Library.Gradients.Title       = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0 }
Library.Gradients.Scroll      = { Start = Color3.fromHex('030303'), End = Color3.fromHex('030303'), Enabled = true, Transparency = 0.6 }
Library.Gradients.Dropdown    = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.75 }
Library.Gradients.Button      = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.75 }
Library.Gradients.Slider      = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.5 }
Library.Gradients.Placeholder = { Start = Color3.fromHex('676767'), End = Color3.fromHex('444444'), Enabled = true, Transparency = 0.5 }
Library.Gradients.Watermark   = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.3 }
Library:UpdateGradients()


local icons = {
    combat   = 'rbxassetid://111386589037485',
    misc     = 'rbxassetid://126028986879491',
    visuals  = 'rbxassetid://115907015044719',
    settings = 'rbxassetid://137300573942266',
}

local CombatTab   = Window:Tab({ Name = "combat",   Icon = icons.combat   })
local MiscTab     = Window:Tab({ Name = "misc",     Icon = icons.misc     })
local VisualsTab  = Window:Tab({ Name = "visuals",  Icon = icons.visuals  })
local SettingsTab = Window:Tab({ Name = "settings", Icon = icons.settings })

local Watermark = Library:Watermark({
    Visible = false,
    Rate = 0.2,
    ScriptName = 'richard',
    version = "V2",
})

local Binds = Library:BindsOverlay({
    Name = 'Hotkeys',
    Icon = 'rbxassetid://81471583706380',
    Position = UDim2.new(0, 20, 0.5, -100),
    Visible = true,
    Width = 200,
})

local function setBindsVisible(v)
    if not Binds then return end
    if Binds.SetVisible then
        Binds:SetVisible(v)
    elseif Binds.SetVisibleState then
        Binds:SetVisibleState(v)
    else
        Binds.Visible = v
    end
end

do
    local s = CombatTab:Section({ Name = "combat binds", Side = 'left', AutoResize = true })

    s:Keybind({
        Name = 'Double Tap', DisplayName = 'Double Tap',
        Key = Enum.KeyCode.X, Mode = 'Toggle', Flag = 'bind_double_tap',
        Callback = function(v) print('Double Tap:', v) end,
    })
    s:Keybind({
        Name = 'Hide Shots', DisplayName = 'Hide Shots',
        Key = Enum.KeyCode.C, Mode = 'Toggle', Flag = 'bind_hide_shots',
        Callback = function(v) print('Hide Shots:', v) end,
    })
    s:Keybind({
        Name = 'Freestanding', DisplayName = 'Freestanding',
        Key = Enum.KeyCode.V, Mode = 'Toggle', Flag = 'bind_freestanding',
        Callback = function(v) print('Freestanding:', v) end,
    })
    s:Keybind({
        Name = 'Force body aim', DisplayName = 'Force body aim',
        Key = Enum.KeyCode.F, Mode = 'Toggle', Flag = 'bind_force_body_aim',
        Callback = function(v) print('Force body aim:', v) end,
    })
    s:Keybind({
        Name = 'Fake Duck', DisplayName = 'Fake Duck',
        Key = Enum.KeyCode.G, Mode = 'Toggle', Flag = 'bind_fake_duck',
        Callback = function(v) print('Fake Duck:', v) end,
    })
end

do
    local s = CombatTab:Section({ Name = "toggle example", Side = 'right', AutoResize = true })
    s:Toggle({
        Name = 'my toggle', Value = false, Flag = 'my_toggle',
        Callback = function(v) print('toggle is now:', v) end,
    })
    s:Toggle({
        Name = 'another toggle', Value = true, Flag = 'another_toggle',
    })
end

do
    local s = CombatTab:Section({ Name = "risky stuff", Side = 'right', AutoResize = true })

    s:Label({
        Name = 'WARNING: The options below are dangerous',
        Risky = true, Bold = true,
    })

    s:Toggle({
        Name = 'Delete All Parts', Value = false, Risky = true, Flag = 'risky_delete',
        Callback = function(v) print('Delete parts:', v) end,
    })

    s:Toggle({
        Name = 'Crash Server', Value = false, Risky = true, Flag = 'risky_crash',
        Callback = function(v)
            if v then
                Library:Notification({ name = 'Risky', description = 'You enabled a risky feature!', time = 3 })
            end
        end,
    })

    s:Divider({ Text = "Safe Options" })

    s:Toggle({
        Name = 'Safe Toggle', Value = false, Flag = 'safe_toggle',
    })

    s:Button({
        Name = 'Nuke Map', Risky = true, Confirm = true,
        Callback = function()
            Library:Notification({ name = 'Risky', description = 'Nuke executed' })
        end,
    })
end

do
    local s = MiscTab:Section({ Name = "slider example", Side = 'left', AutoResize = true })
    s:Slider({
        Name = 'speed', Value = 1, Min = 0.1, Max = 10, Float = 0.1, Suffix = '%s x',
        Flag = 'slider_speed', Thickness = 12,
        Callback = function(v) print('speed =', v) end,
    })
    s:Slider({
        Name = 'compact speed', Value = 5, Min = 0, Max = 20, Float = 0.5, Suffix = '%s x',
        Flag = 'compact_speed', Compact = true, Thickness = 14,
        Callback = function(v) print('compact speed =', v) end,
    })
end

do
    local s = MiscTab:Section({ Name = "dropdown example", Side = 'left', AutoResize = true })
    s:Dropdown({
        Name = 'single select', Values = {'a', 'b', 'c'}, Value = 'a',
        Flag = 'dd_single', Gradient = true,
        Callback = function(v) print('selected', v) end,
    })
    s:Dropdown({
        Name = 'multi select', Values = {'x', 'y', 'z'}, Value = {'x'},
        Multi = true, Flag = 'dd_multi', Gradient = true, ColorPicker = true,
        Callback = function(v)
            for _, item in ipairs(v) do print('checked:', item) end
        end,
    })
end

do
    local s = MiscTab:Section({ Name = "textbox example", Side = 'right', AutoResize = true })
    s:Textbox({
        Name = 'config name', Value = '', Placeholder = 'type here...', Flag = 'textbox_value',
        Callback = function(v) print('typed:', v) end,
    })
end

do
    local s = MiscTab:Section({ Name = "button example", Side = 'right', AutoResize = true })
    s:Button({
        Name = 'click me',
        Callback = function()
            print('button pressed!')
            Library:Notification({ Name = 'Example', Description = 'You clicked the button', Type = 'Time', Time = 3 })
        end,
    })
    s:Divider({ Text = "Actions" })
    s:Button({ Name = 'gradient button', Gradient = true, Callback = function() print('gradient button pressed!') end })
end

do
    local s = VisualsTab:Section({ Name = "colorpicker example", Side = 'left', AutoResize = true })
    s:Colorpicker({
        Name = 'my color', Value = Color3.fromRGB(255, 255, 255), Alpha = 0, Flag = 'my_color',
        Callback = function(d) print('color:', d.c, 'alpha:', d.a) end,
    })
end

do
    local s = VisualsTab:Section({ Name = "nested popup example", Side = 'right', AutoResize = true })
    local level1 = s:Toggle({ Name = 'level 1', Value = false, Flag = 'level1' })
    local popup1 = level1:Popup({ Size = 200 })
    local level2 = popup1:Toggle({ Name = 'level 2', Value = false, Flag = 'level2' })
    local popup2 = level2:Popup({ Size = 200 })
    popup2:Slider({
        Name = 'deep setting', Value = 5, Min = 0, Max = 10, Float = 1, Flag = 'deep_slider', Thickness = 12,
        Callback = function(v) print('deep =', v) end,
    })
end

do
    local cs = SettingsTab:Section({ Name = 'configs', Side = 'left',  AutoResize = true })
    local us = SettingsTab:Section({ Name = 'server',  Side = 'left',  AutoResize = true })
    local ts = SettingsTab:Section({ Name = 'theme',   Side = 'right', AutoResize = false, MinHeight = 1000, MaxHeight = 1000 })

    cs:Textbox({
        Name = 'config name',
        Value = '',
        Placeholder = 'config name...',
        Flag = 'config_name',
    })

    local cfgPath = 'richard\\Configs'
    local function getCfgList()
        local cfg = {}
        if isfolder and isfolder(cfgPath) then
            for _, f in pairs(listfiles(cfgPath)) do
                if f:match('%.json$') then
                    local n = f:match('([^\\/]+)%.json$')
                    if n then table.insert(cfg, n) end
                end
            end
        end
        return #cfg > 0 and cfg or {'no configs'}
    end

    local dd = cs:Dropdown({
        Name = 'configs',
        Values = getCfgList(),
        Value = getCfgList()[1] or 'no configs',
        Callback = function(value) end,
        Flag = 'selected_config',
        Gradient = true,
    })

    local function cfgOp(op)
        local flag = (op == 'load' or op == 'del' or op == 'ovr') and 'selected_config' or 'config_name'
        local nm = Library.Flags[flag]
        if not nm or nm == '' or nm == 'no configs' then return end
        if isfolder and not isfolder(cfgPath) then
            if makefolder then makefolder(cfgPath) end
        end
        local p = cfgPath .. '\\' .. nm .. '.json'
        if op == 'save' or op == 'ovr' then
            local s, d = pcall(function() return Library.GetConfig() end)
            if s and d and writefile then
                writefile(p, d)
                if dd and dd.Refresh then dd.Refresh(getCfgList()) end
            end
        elseif op == 'load' then
            if isfile and isfile(p) then
                local s, d = pcall(function() return readfile(p) end)
                if s and d then
                    pcall(function() Library.LoadConfig(d) end)
                    task.defer(function()
                        if Library.Flags then
                            for theme, _ in pairs(Library.Theme) do
                                local flagKey = 'theme_' .. theme:lower():gsub(' ', '_')
                                if Library.Flags[flagKey] then
                                    Library.UpdateTheme(theme, Library.Flags[flagKey])
                                end
                            end
                            if Library.UpdateGradients then
                                Library:UpdateGradients()
                            end
                            if Library.Flags['binds_visible'] ~= nil then
                                setBindsVisible(Library.Flags['binds_visible'])
                            end
                        end
                    end)
                end
            end
        elseif op == 'del' then
            if isfile and isfile(p) then
                pcall(function() delfile(p) end)
                if dd and dd.Refresh then dd.Refresh(getCfgList()) end
            end
        end
    end

    cs:Button({ Name = 'save',         Callback = function() cfgOp('save') end })
    cs:Button({ Name = 'load',         Callback = function() cfgOp('load') end })
    cs:Button({ Name = 'overwrite',    Callback = function() cfgOp('ovr')  end })
    cs:Button({ Name = 'delete',       Callback = function() cfgOp('del')  end })
    cs:Button({ Name = 'refresh list', Callback = function()
        if dd and dd.Refresh then dd.Refresh(getCfgList()) end
    end })

    us:Button({ Name = 'copy jobid',  Callback = function() setclipboard(game.JobId) end })
    us:Button({ Name = 'copy gameid', Callback = function() setclipboard(tostring(game.GameId)) end })
    us:Button({
        Name = 'copy join script',
        Callback = function()
            setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ',"' .. game.JobId .. '",game.Players.LocalPlayer)')
        end,
    })
    us:Button({
        Name = 'rejoin',
        Callback = function()
            local tps = game:GetService('TeleportService')
            tps:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
        end,
    })
    us:Button({
        Name = 'join new server',
        Callback = function()
            local min, max = Library.Flags['srv_min'] or 1, Library.Flags['srv_max'] or 15
            local http = game:GetService('HttpService')
            local tps = game:GetService('TeleportService')
            local s, d = pcall(function()
                return http:JSONDecode(game:HttpGetAsync('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
            end)
            if not s then return end
            local valid = {}
            for _, srv in pairs(d.data) do
                if srv.playing >= min and srv.playing <= max then
                    table.insert(valid, srv)
                end
            end
            if #valid > 0 then
                tps:TeleportToPlaceInstance(game.PlaceId, valid[math.random(1, #valid)].id, game.Players.LocalPlayer)
            end
        end,
    })
    us:Slider({ Name = 'min players', Value = 1,  Min = 1, Max = 30, Float = 1, Thickness = 16, Compact = true, Callback = function() end, Flag = 'srv_min' })
    us:Slider({ Name = 'max players', Value = 15, Min = 1, Max = 30, Float = 1, Thickness = 16, Compact = true, Callback = function() end, Flag = 'srv_max' })

    ts:Label({ Name = 'menu', Bold = true })

    ts:Keybind({
        Name = 'menu keybind',
        Key = Enum.KeyCode.RightControl,
        Mode = 'Toggle',
        Callback = function()
            if Window then
                Window:Open()
            end
        end,
        Flag = 'menu_keybind',
    })

    ts:Divider({ Text = "overlays" })

    local watermarkToggle = ts:Toggle({
        Name = 'watermark',
        Value = false,
        Flag = 'watermark_enabled',
        Callback = function(v)
            if Watermark and Watermark.SetVisible then Watermark.SetVisible(v) end
        end,
    })

    local watermarkPopup = watermarkToggle:Popup({ Size = 240 })

    watermarkPopup:Slider({
        Name = 'update rate',
        Value = 200,
        Min = 0,
        Max = 1000,
        Float = 1,
        Suffix = '%s ms',
        Thickness = 12,
        Flag = 'watermark_rate',
        Callback = function(v)
            Library.Flags.watermark_rate = v
            if Watermark and Watermark.SetRate then Watermark.SetRate(v / 1000) end
        end,
    })

    watermarkPopup:Toggle({
        Name = 'attach watermark',
        Value = true,
        Flag = 'watermark_attached',
        Callback = function(v)
            if Watermark and Watermark.SetAttached then Watermark.SetAttached(v) end
        end,
    })

    local bindsToggle = ts:Toggle({
        Name = 'show binds overlay',
        Value = true,
        Flag = 'binds_visible',
        Callback = function(v)
            setBindsVisible(v)
        end,
    })

    -- All binds colors AND transparencies live here
    local bindsPopup = bindsToggle:Popup({ Size = 240 })

    bindsPopup:Divider({ Text = "Header" })

    bindsPopup:Colorpicker({
        Name = 'background',
        Value = Library.Theme['Binds Header Background'],
        Alpha = 0,
        Flag = 'theme_binds_header_background',
        Callback = function(d) Library.UpdateTheme('Binds Header Background', d.c) end,
    })
    bindsPopup:Slider({
        Name = 'background transparency',
        Value = math.floor((Binds.Colors.HeaderTransparency or 0) * 100),
        Min = 0, Max = 100, Float = 1, Suffix = '%s%%', Thickness = 10,
        Flag = 'binds_header_bg_trans',
        Callback = function(v)
            Binds.Colors.HeaderTransparency = v / 100
            Binds.Objects.HeaderContainer.BackgroundTransparency = v / 100
        end,
    })

    bindsPopup:Colorpicker({
        Name = 'title color',
        Value = Library.Theme['Binds Header Title'],
        Alpha = 0,
        Flag = 'theme_binds_header_title',
        Callback = function(d) Library.UpdateTheme('Binds Header Title', d.c) end,
    })

    bindsPopup:Colorpicker({
        Name = 'icon color',
        Value = Library.Theme['Binds Header Icon'],
        Alpha = 0,
        Flag = 'theme_binds_header_icon',
        Callback = function(d) Library.UpdateTheme('Binds Header Icon', d.c) end,
    })


    bindsPopup:Divider({ Text = "Row - Inactive" })

    bindsPopup:Colorpicker({
        Name = 'background',
        Value = Library.Theme['Binds Row Background'],
        Alpha = 0,
        Flag = 'theme_binds_row_background',
        Callback = function(d) Library.UpdateTheme('Binds Row Background', d.c) end,
    })
    bindsPopup:Slider({
        Name = 'background transparency',
        Value = math.floor((Binds.Colors.RowTransparency or 0) * 100),
        Min = 0, Max = 100, Float = 1, Suffix = '%s%%', Thickness = 10,
        Flag = 'binds_row_bg_trans',
        Callback = function(v)
            Binds.Colors.RowTransparency = v / 100
            for _, entry in pairs(Binds.Rows) do
                if not entry.Active then
                    entry.Row.BackgroundTransparency = v / 100
                end
            end
        end,
    })

    bindsPopup:Colorpicker({
        Name = 'name color',
        Value = Library.Theme['Binds Row Name'],
        Alpha = 0,
        Flag = 'theme_binds_row_name',
        Callback = function(d) Library.UpdateTheme('Binds Row Name', d.c) end,
    })

    bindsPopup:Colorpicker({
        Name = 'mode color',
        Value = Library.Theme['Binds Row Mode'],
        Alpha = 0,
        Flag = 'theme_binds_row_mode',
        Callback = function(d) Library.UpdateTheme('Binds Row Mode', d.c) end,
    })

    bindsPopup:Colorpicker({
        Name = 'key color',
        Value = Library.Theme['Binds Row Key'],
        Alpha = 0,
        Flag = 'theme_binds_row_key',
        Callback = function(d) Library.UpdateTheme('Binds Row Key', d.c) end,
    })

    bindsPopup:Divider({ Text = "Row - Active" })

    bindsPopup:Colorpicker({
        Name = 'background',
        Value = Library.Theme['Binds Row Active Background'],
        Alpha = 0,
        Flag = 'theme_binds_row_active_background',
        Callback = function(d) Library.UpdateTheme('Binds Row Active Background', d.c) end,
    })
    bindsPopup:Slider({
        Name = 'background transparency',
        Value = math.floor((Binds.Colors.RowActiveTransparency or 0) * 100),
        Min = 0, Max = 100, Float = 1, Suffix = '%s%%', Thickness = 10,
        Flag = 'binds_row_active_bg_trans',
        Callback = function(v)
            Binds.Colors.RowActiveTransparency = v / 100
            for _, entry in pairs(Binds.Rows) do
                if entry.Active then
                    entry.Row.BackgroundTransparency = v / 100
                end
            end
        end,
    })

    bindsPopup:Colorpicker({
        Name = 'name color',
        Value = Library.Theme['Binds Row Active Name'],
        Alpha = 0,
        Flag = 'theme_binds_row_active_name',
        Callback = function(d) Library.UpdateTheme('Binds Row Active Name', d.c) end,
    })

    bindsPopup:Colorpicker({
        Name = 'mode color',
        Value = Library.Theme['Binds Row Active Mode'],
        Alpha = 0,
        Flag = 'theme_binds_row_active_mode',
        Callback = function(d) Library.UpdateTheme('Binds Row Active Mode', d.c) end,
    })

    bindsPopup:Colorpicker({
        Name = 'key color',
        Value = Library.Theme['Binds Row Active Key'],
        Alpha = 0,
        Flag = 'theme_binds_row_active_key',
        Callback = function(d) Library.UpdateTheme('Binds Row Active Key', d.c) end,
    })

    bindsPopup:Divider({ Text = "Text Outline" })

    bindsPopup:Colorpicker({
        Name = 'outline color',
        Value = Library.Theme['Binds Text Outline'],
        Alpha = 0,
        Flag = 'theme_binds_text_outline',
        Callback = function(d) Library.UpdateTheme('Binds Text Outline', d.c) end,
    })
    bindsPopup:Slider({
        Name = 'outline transparency',
        Value = math.floor((Binds.Colors.TextOutlineTransparency or 0) * 100),
        Min = 0, Max = 100, Float = 1, Suffix = '%s%%', Thickness = 10,
        Flag = 'binds_text_outline_trans',
        Callback = function(v) Binds:SetTextOutlineTransparency(v / 100) end,
    })

    ts:Divider({ Text = "background" })

    local darkBgToggle = ts:Toggle({
        Name = 'dark background',
        Value = false,
        Flag = 'dark_bg_enabled',
        Callback = function(v)
            Library.SetDarkBackground(v)
        end,
    })

    local darkBgPopup = darkBgToggle:Popup({ Size = 240 })

    darkBgPopup:Slider({
        Name = 'transparency',
        Value = math.floor((Library.Background.DarkTransparency or 0.5) * 100),
        Min = 0,
        Max = 100,
        Float = 1,
        Suffix = '%s%%',
        Thickness = 12,
        Flag = 'dark_bg_transparency',
        Callback = function(v) Library.SetDarkTransparency(v / 100) end,
    })

    local blurBgToggle = ts:Toggle({
        Name = 'blur background',
        Value = false,
        Flag = 'blur_bg_enabled',
        Callback = function(v)
            Library.SetBlurBackground(v)
        end,
    })

    local blurBgPopup = blurBgToggle:Popup({ Size = 240 })

    blurBgPopup:Slider({
        Name = 'blur size',
        Value = Library.Background.BlurSize or 12,
        Min = 0,
        Max = 56,
        Float = 1,
        Suffix = '%s',
        Thickness = 12,
        Flag = 'blur_bg_size',
        Callback = function(v) Library.SetBlurSize(v) end,
    })

    ts:Divider({ Text = "theme colors" })
    for theme, color in pairs(Library.Theme) do
        if not Library.HiddenThemeKeys[theme] then
            ts:Colorpicker({
                Name = theme:lower(),
                Value = color,
                Alpha = 0,
                Callback = function(d)
                    Library.UpdateTheme(theme, d.c)
                end,
                Flag = 'theme_' .. theme:lower():gsub(' ', '_'),
            })
        end
    end

    ts:Divider({ Text = "gradients" })

    for gradName, gradData in pairs(Library.Gradients) do
        local gradToggle = ts:Toggle({
            Name = gradName:lower(),
            Value = gradData.Enabled ~= false,
            Flag = 'grad_' .. gradName:lower() .. '_enabled',
            Callback = function(v)
                Library.Gradients[gradName].Enabled = v
                Library:UpdateGradients()
            end,
        })

        local gradPopup = gradToggle:Popup({ Size = 240 })

        gradPopup:Colorpicker({
            Name = 'start',
            Value = gradData.Start,
            Alpha = 0,
            Flag = 'grad_' .. gradName:lower() .. '_start',
            Callback = function(d)
                Library.Gradients[gradName].Start = d.c
                Library:UpdateGradients()
            end,
        })

        gradPopup:Colorpicker({
            Name = 'end',
            Value = gradData.End,
            Alpha = 0,
            Flag = 'grad_' .. gradName:lower() .. '_end',
            Callback = function(d)
                Library.Gradients[gradName].End = d.c
                Library:UpdateGradients()
            end,
        })

        gradPopup:Slider({
            Name = 'transparency',
            Value = gradData.Transparency * 100,
            Min = 0,
            Max = 100,
            Float = 1,
            Suffix = '%s%%',
            Thickness = 12,
            Flag = 'grad_' .. gradName:lower() .. '_trans',
            Callback = function(v)
                Library.Gradients[gradName].Transparency = v / 100
                Library:UpdateGradients()
            end,
        })
    end
end


CombatTab.Set(true)

Library.Notification({
    name = 'richard has been loaded',
    type = 'Time',
    time = 5,
})
