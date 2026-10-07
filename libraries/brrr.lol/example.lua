local LoadingTick = os.clock()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bidness1337/GUI-s/refs/heads/main/libraries/brrr.lol/change-log/update%200.4.lua"))()

-- Main window
local Window = Library:Window({
    Name = "brrr.lol",
    Size = UDim2.new(0, 550, 0, 475),
    Open = true,
    FontSize = 20
})

-- Theme colors (global styling)
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

-- Configure gradients
Library.Gradients.Title       = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0 }
Library.Gradients.Scroll      = { Start = Color3.fromHex('030303'), End = Color3.fromHex('030303'), Enabled = true, Transparency = 0.6 }
Library.Gradients.Dropdown    = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.75 }
Library.Gradients.Button      = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.75 }
Library.Gradients.Slider      = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.5 }
Library.Gradients.Placeholder = { Start = Color3.fromHex('676767'), End = Color3.fromHex('444444'), Enabled = true, Transparency = 0.5 }
Library.Gradients.Watermark   = { Start = Color3.fromHex('ddfbff'), End = Color3.fromHex('7a9ba3'), Enabled = true, Transparency = 0.3 }
Library:UpdateGradients()

-- Tab icons
local icons = {
    combat   = 'rbxassetid://111386589037485',
    misc     = 'rbxassetid://126028986879491',
    visuals  = 'rbxassetid://115907015044719',
    settings = 'rbxassetid://137300573942266',
}

-- Tabs
local CombatTab   = Window:Tab({ Name = "combat",   Icon = icons.combat   })
local MiscTab     = Window:Tab({ Name = "misc",     Icon = icons.misc     })
local VisualsTab  = Window:Tab({ Name = "visuals",  Icon = icons.visuals  })
local SettingsTab = Window:Tab({ Name = "settings", Icon = icons.settings })

-- Watermark
local Watermark = Library:Watermark({
    Text = 'brrr.lol | {fps} FPS | {ping} ms',
    Visible = false,
    Rate = 0.2,
})

-- ============================================================
-- COMBAT TAB
-- ============================================================

-- Toggle example (checkbox on the LEFT) — auto-resizes to fit content
do
    local example_section = CombatTab:Section({
        Name = "toggle example",
        Side = 'left',
        AutoResize = true,
        MinHeight = 80,
        MaxHeight = 300,
    })

    example_section:Toggle({
        Name = 'my toggle',
        Value = false,
        Flag = 'my_toggle',
        Callback = function(v)
            print('toggle is now:', v)
        end,
    })
end

-- Divider example
do
    local divider_section = CombatTab:Section({
        Name = "divider example",
        Side = 'left',
        AutoResize = true,
    })

    divider_section:Divider({ Text = "Combat Settings" })

    divider_section:Toggle({
        Name = 'divider toggle',
        Value = false,
        Flag = 'divider_toggle',
    })

    divider_section:Divider({ Text = "More Options" })

    divider_section:Toggle({
        Name = 'another toggle',
        Value = true,
        Flag = 'another_toggle',
    })
end

-- Toggle with popup
do
    local popup_section = CombatTab:Section({
        Name = "popup example",
        Side = 'left',
        AutoResize = true,
    })

    local main_toggle = popup_section:Toggle({
        Name = 'toggle w/ popup',
        Value = false,
        Flag = 'toggle_with_popup',
    })

    local popup = main_toggle:Popup({ Size = 200 })

    popup:Slider({
        Name = 'some value',
        Value = 50,
        Min = 0,
        Max = 100,
        Float = 1,
        Suffix = '%s%%',
        Flag = 'popup_slider',
        Thickness = 12,
        Callback = function(v)
            print('slider changed to', v)
        end,
    })

    popup:Dropdown({
        Name = 'pick one',
        Values = {'option a', 'option b', 'option c'},
        Value = 'option a',
        Flag = 'popup_dropdown',
        Gradient = true,
        ColorPicker = true,
        Callback = function(v)
            print('picked', v)
        end,
    })

    popup:Label({
        Name = 'this is just text',
        Bold = false,
        Dark = true,
    })
end

-- Compact slider
do
    local compact_section = CombatTab:Section({
        Name = "compact slider",
        Side = 'right',
        AutoResize = true,
    })

    compact_section:Slider({
        Name = 'compact mode',
        Value = 50,
        Min = 0,
        Max = 100,
        Float = 1,
        Suffix = '%s%%',
        Flag = 'compact_slider',
        Compact = true,
        Thickness = 14,
        Callback = function(v)
            print('compact slider =', v)
        end,
    })
end

-- Keybind example
do
    local keybind_section = CombatTab:Section({
        Name = "keybind example",
        Side = 'right',
        AutoResize = true,
    })

    local toggl = keybind_section:Toggle({
        Name = 'feature with key',
        Value = false,
        Flag = 'keybind_toggle',
        Callback = function(v)
            print('enabled:', v)
        end,
    })

    toggl:Keybind({
        Key = Enum.KeyCode.X,
        Mode = 'Toggle',
        Flag = 'keybind_value',
        Callback = function(v)
            print('keybind triggered, state =', v)
        end,
    })
end

-- ============================================================
-- MISC TAB
-- ============================================================

-- Slider examples
do
    local slider_section = MiscTab:Section({
        Name = "slider example",
        Side = 'left',
        AutoResize = true,
    })

    slider_section:Slider({
        Name = 'speed',
        Value = 1,
        Min = 0.1,
        Max = 10,
        Float = 0.1,
        Suffix = '%s x',
        Flag = 'slider_speed',
        Thickness = 12,
        Callback = function(v)
            print('speed =', v)
        end,
    })

    slider_section:Slider({
        Name = 'compact speed',
        Value = 5,
        Min = 0,
        Max = 20,
        Float = 0.5,
        Suffix = '%s x',
        Flag = 'compact_speed',
        Compact = true,
        Thickness = 14,
        Callback = function(v)
            print('compact speed =', v)
        end,
    })
end

-- Dropdown examples
do
    local dd_section = MiscTab:Section({
        Name = "dropdown example",
        Side = 'left',
        AutoResize = true,
    })

    dd_section:Dropdown({
        Name = 'single select',
        Values = {'a', 'b', 'c'},
        Value = 'a',
        Flag = 'dd_single',
        Gradient = true,
        Callback = function(v) print('selected', v) end,
    })

    dd_section:Dropdown({
        Name = 'multi select',
        Values = {'x', 'y', 'z'},
        Value = {'x'},
        Multi = true,
        Flag = 'dd_multi',
        Gradient = true,
        ColorPicker = true,
        Callback = function(v)
            for _, item in ipairs(v) do
                print('checked:', item)
            end
        end,
    })
end

-- Textbox example
do
    local tb_section = MiscTab:Section({
        Name = "textbox example",
        Side = 'right',
        AutoResize = true,
    })

    tb_section:Textbox({
        Name = 'config name',
        Value = '',
        Placeholder = 'type here...',
        Flag = 'textbox_value',
        Callback = function(v)
            print('typed:', v)
        end,
    })
end

-- Button example
do
    local btn_section = MiscTab:Section({
        Name = "button example",
        Side = 'right',
        AutoResize = true,
    })

    btn_section:Button({
        Name = 'click me',
        Callback = function()
            print('button pressed!')
            Library:Notification({
                Name = 'Example',
                Description = 'You clicked the button',
                Type = 'Time',
                Time = 3,
            })
        end,
    })

    btn_section:Divider({ Text = "Actions" })

    btn_section:Button({
        Name = 'gradient button',
        Gradient = true,
        Callback = function()
            print('gradient button pressed!')
        end,
    })
end

-- ============================================================
-- VISUALS TAB
-- ============================================================

-- Colorpicker example
do
    local cp_section = VisualsTab:Section({
        Name = "colorpicker example",
        Side = 'left',
        AutoResize = true,
    })

    cp_section:Colorpicker({
        Name = 'my color',
        Value = Color3.fromRGB(255, 255, 255),
        Alpha = 0,
        Flag = 'my_color',
        Callback = function(d)
            print('color:', d.c, 'alpha:', d.a)
        end,
    })
end

-- Nested popups
do
    local nested_section = VisualsTab:Section({
        Name = "nested popup example",
        Side = 'right',
        AutoResize = true,
    })

    local level1 = nested_section:Toggle({
        Name = 'level 1',
        Value = false,
        Flag = 'level1',
    })

    local popup1 = level1:Popup({ Size = 200 })

    local level2 = popup1:Toggle({
        Name = 'level 2',
        Value = false,
        Flag = 'level2',
    })

    local popup2 = level2:Popup({ Size = 200 })

    popup2:Slider({
        Name = 'deep setting',
        Value = 5,
        Min = 0,
        Max = 10,
        Float = 1,
        Flag = 'deep_slider',
        Thickness = 12,
        Callback = function(v) print('deep =', v) end,
    })
end

-- ============================================================
-- SETTINGS TAB
-- ============================================================
do
    local cs = SettingsTab:Section({ Name = 'configs', Side = 'left',  AutoResize = true })
    local us = SettingsTab:Section({ Name = 'server',  Side = 'left',  AutoResize = true })
    local ts = SettingsTab:Section({ Name = 'theme',   Side = 'right', AutoResize = false, MaxHeight = 800 })

    -- ---------- Configs (LEFT) ----------
    cs:Textbox({
        Name = 'config name',
        Value = '',
        Placeholder = 'config name...',
        Flag = 'config_name',
    })

    local cfgPath = 'brrr.lol\\Configs'
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

    -- ---------- Server / teleport (LEFT) ----------
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
    us:Slider({ Name = 'min players', Value = 1,  Min = 1, Max = 30, Float = 1, Thickness = 12, Callback = function() end, Flag = 'srv_min' })
    us:Slider({ Name = 'max players', Value = 15, Min = 1, Max = 30, Float = 1, Thickness = 12, Callback = function() end, Flag = 'srv_max' })

    -- ---------- Theme (RIGHT): menu keybind, watermark, gradients, theme colors ----------

    ts:Label({ Name = 'menu', Bold = true })
    ts:Keybind({
        Name = 'menu keybind',
        Key = Enum.KeyCode.RightControl,
        Mode = 'Toggle',
        Callback = function(v)
            if Window and Window.Open then Window:Open() end
        end,
        Flag = 'menu_keybind',
    })

    ts:Divider({ Text = "watermark" })

    local watermarkToggle = ts:Toggle({
        Name = 'watermark',
        Value = false,
        Callback = function(v)
            if Watermark and Watermark.SetVisible then Watermark.SetVisible(v) end
        end,
        Flag = 'watermark_enabled',
    })

    local watermarkPopup = watermarkToggle:Popup({Size = 220})

    local function updateWatermark()
        local text = 'brrr.lol'
        local types = Library.Flags.watermark_types
        if types and #types > 0 then
            for _, v in ipairs(types) do
                text = text .. ' | {' .. v .. '}'
            end
        end
        if Watermark and Watermark.SetText then Watermark.SetText(text) end
    end

    watermarkPopup:Slider({
        Name = 'update rate',
        Value = 200,
        Min = 0,
        Max = 1000,
        Float = 1,
        Suffix = '%s ms',
        Thickness = 12,
        Callback = function(v)
            Library.Flags.watermark_rate = v
            if Watermark and Watermark.SetRate then Watermark.SetRate(v / 1000) end
        end,
        Flag = 'watermark_rate',
    })

    watermarkPopup:Dropdown({
        Name = 'info types',
        Values = {'fps', 'ping', 'time', 'date', 'hour', 'minute', 'second', 'ap', 'month', 'day', 'year', 'game', 'n'},
        Value = {'game', 'time'},
        Multi = true,
        Gradient = true,
        ColorPicker = true,
        Callback = function(v)
            Library.Flags.watermark_types = v
            updateWatermark()
        end,
        Flag = 'watermark_types',
    })

    ts:Toggle({
        Name = 'attach watermark',
        Value = true,
        Callback = function(v)
            if Watermark and Watermark.SetAttached then Watermark.SetAttached(v) end
        end,
        Flag = 'watermark_attached',
    })

    ts:Divider({ Text = "theme colors" })
    for theme, color in pairs(Library.Theme) do
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

    ts:Divider({ Text = "gradients" })
    for gradName, gradData in pairs(Library.Gradients) do
        ts:Label({ Name = gradName, Bold = true })

        ts:Colorpicker({
            Name = 'start',
            Value = gradData.Start,
            Alpha = 0,
            Callback = function(d)
                Library.Gradients[gradName].Start = d.c
                Library:UpdateGradients()
            end,
            Flag = 'grad_' .. gradName:lower() .. '_start',
        })

        ts:Colorpicker({
            Name = 'end',
            Value = gradData.End,
            Alpha = 0,
            Callback = function(d)
                Library.Gradients[gradName].End = d.c
                Library:UpdateGradients()
            end,
            Flag = 'grad_' .. gradName:lower() .. '_end',
        })

        ts:Slider({
            Name = 'transparency',
            Value = gradData.Transparency * 100,
            Min = 0,
            Max = 100,
            Float = 1,
            Suffix = '%s%%',
            Thickness = 12,
            Callback = function(v)
                Library.Gradients[gradName].Transparency = v / 100
                Library:UpdateGradients()
            end,
            Flag = 'grad_' .. gradName:lower() .. '_trans',
        })

        ts:Divider({ Text = "" })
    end
end

-- Select default tab
CombatTab.Set(true)

-- Welcome notification
Library.Notification({
    name = 'brrr.lol',
    description = 'template loaded — no features active',
    type = 'Time',
    time = 5,
})
