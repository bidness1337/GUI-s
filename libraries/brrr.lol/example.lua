local LoadingTick = os.clock()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bidness1337/GUI-s/refs/heads/main/libraries/brrr.lol/library.lua"))()

-- Main window
local Window = Library:Window({
    Name = "brrr.lol",
    Size = UDim2.new(0, 550, 0, 470),
    Open = true,
    FontSize = 20
})

-- Theme colors (global styling)
Library.Theme.Accent             = Color3.fromHex('ddfbff')
Library.Theme.Text               = Color3.fromHex('ddfbff')
Library.Theme['Dark Text']       = Color3.fromHex('565656')
Library.Theme.Background         = Color3.fromHex('030303')
Library.Theme['Section Background'] = Color3.fromHex('000000')
Library.Theme['Page Background'] = Color3.fromHex('000000')
Library.Theme['Light Text']      = Color3.fromHex('676767')
Library.Theme['Inline']          = Color3.fromHex('131313')
Library.Theme['Dark Background'] = Color3.fromHex('000000')

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

-- Watermark (top-of-screen info display)
-- Placeholders: {fps}, {ping}, {time}, etc.
local Watermark = Library:Watermark({
    Text = 'brrr.lol | {fps} FPS | {ping} ms',
    Visible = true,
    Rate = 0.2, -- refresh rate in seconds
})

-- Flags store the current value of every UI element.
-- Access anytime with Library.Flags["flag_name"]
Library.Flags.watermark_enabled = false

-- Toggle: simple on/off switch
do
    local example_section = CombatTab:Section({
        Name = "toggle example",
        Side = 'left', -- 'left' or 'right' column
    })

    example_section:Toggle({
        Name = 'my toggle',     -- label shown next to switch
        Value = false,          -- default state
        Flag = 'my_toggle',     -- save key for configs
        Callback = function(v)  -- runs when toggled
            print('toggle is now:', v)
        end,
    })
end

-- Toggle with popup: popup is an extra settings panel attached to a toggle.
-- Click the little arrow on the toggle to open it.
do
    local popup_section = CombatTab:Section({
        Name = "popup example",
        Side = 'left',
    })

    local main_toggle = popup_section:Toggle({
        Name = 'toggle w/ popup',
        Value = false,
        Flag = 'toggle_with_popup',
    })

    -- creates a popup attached to the toggle above
    local popup = main_toggle:Popup({ Size = 200 })

    popup:Slider({
        Name = 'some value',
        Value = 50,
        Min = 0,
        Max = 100,
        Float = 1,        -- 1 = integer steps, 0.1 = decimal
        Suffix = '%s%%',  -- appended to the number
        Flag = 'popup_slider',
        Callback = function(v)
            print('slider changed to', v)
        end,
    })

    popup:Dropdown({
        Name = 'pick one',
        Values = {'option a', 'option b', 'option c'},
        Value = 'option a', -- default selection
        Flag = 'popup_dropdown',
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

-- Keybind: attaches a hotkey to a toggle.
-- Modes: 'Toggle', 'Hold', 'Always'
do
    local keybind_section = CombatTab:Section({
        Name = "keybind example",
        Side = 'right',
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
        Key = Enum.KeyCode.X,  -- use Enum.KeyCode.Unknown for no bind
        Mode = 'Toggle',
        Flag = 'keybind_value',
        Callback = function(v)
            print('keybind triggered, state =', v)
        end,
    })
end

-- Slider
do
    local slider_section = MiscTab:Section({
        Name = "slider example",
        Side = 'left',
    })

    slider_section:Slider({
        Name = 'speed',
        Value = 1,         -- default value
        Min = 0.1,         -- minimum
        Max = 10,          -- maximum
        Float = 0.1,       -- decimal precision
        Suffix = '%s x',   -- unit shown after number
        Flag = 'slider_speed',
        Callback = function(v)
            print('speed =', v)
        end,
    })
end

-- Dropdown: single or multi-select list
do
    local dd_section = MiscTab:Section({
        Name = "dropdown example",
        Side = 'left',
    })

    -- single select
    dd_section:Dropdown({
        Name = 'single select',
        Values = {'a', 'b', 'c'},
        Value = 'a',
        Flag = 'dd_single',
        Callback = function(v) print('selected', v) end,
    })

    -- multi select
    dd_section:Dropdown({
        Name = 'multi select',
        Values = {'x', 'y', 'z'},
        Value = {'x'},  -- table of defaults
        Multi = true,   -- enables multi-pick
        Flag = 'dd_multi',
        Callback = function(v)
            -- v is a table of all checked items
            for _, item in ipairs(v) do
                print('checked:', item)
            end
        end,
    })
end

-- Textbox: free text input
do
    local tb_section = MiscTab:Section({
        Name = "textbox example",
        Side = 'right',
    })

    tb_section:Textbox({
        Name = 'config name',
        Value = '',                  -- starting text
        Placeholder = 'type here...', -- ghost text when empty
        Flag = 'textbox_value',
        Callback = function(v)
            print('typed:', v)
        end,
    })
end

-- Button: clickable action
do
    local btn_section = MiscTab:Section({
        Name = "button example",
        Side = 'right',
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
end

-- Colorpicker: returns { c = Color3, a = alpha 0-1 }
do
    local cp_section = VisualsTab:Section({
        Name = "colorpicker example",
        Side = 'left',
    })

    cp_section:Colorpicker({
        Name = 'my color',
        Value = Color3.fromRGB(255, 255, 255),
        Alpha = 0,
        Flag = 'my_color',
        Callback = function(d)
            -- d.c = Color3, d.a = transparency
            print('color:', d.c, 'alpha:', d.a)
        end,
    })
end

-- Nested popups: popups can go inside popups (chains of submenus)
do
    local nested_section = VisualsTab:Section({
        Name = "nested popup example",
        Side = 'right',
    })

    -- level 1: the toggle itself
    local level1 = nested_section:Toggle({
        Name = 'level 1',
        Value = false,
        Flag = 'level1',
    })

    -- level 2 popup attached to level 1
    local popup1 = level1:Popup({ Size = 200 })

    local level2 = popup1:Toggle({
        Name = 'level 2',
        Value = false,
        Flag = 'level2',
    })

    -- level 3 popup attached to level 2
    local popup2 = level2:Popup({ Size = 200 })

    popup2:Slider({
        Name = 'deep setting',
        Value = 5,
        Min = 0,
        Max = 10,
        Float = 1,
        Flag = 'deep_slider',
        Callback = function(v) print('deep =', v) end,
    })
end

-- Settings tab: kept fully intact (configs, watermark controls, theme colorpickers, game panel)
do
    local cs = SettingsTab:Section({
        Name = 'configs',
        Side = 'left',
    })

    local us = SettingsTab:Section({
        Name = 'utility',
        Side = 'left',
    })

    local ts = SettingsTab:Section({
        Name = 'theme',
        Side = 'right',
    })

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
                    if n then
                        table.insert(cfg, n)
                    end
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
    })

    local function cfgOp(op)
        local flag = (op == 'load' or op == 'del' or op == 'ovr') and 'selected_config' or 'config_name'
        local nm = Library.Flags[flag]
        if not nm or nm == '' or nm == 'no configs' then
            return
        end
        if isfolder and not isfolder(cfgPath) then
            if makefolder then makefolder(cfgPath) end
        end
        local p = cfgPath .. '\\' .. nm .. '.json'
        if op == 'save' or op == 'ovr' then
            local s, d = pcall(function()
                return Library.GetConfig()
            end)
            if s and d and writefile then
                writefile(p, d)
                if dd and dd.Refresh then
                    dd.Refresh(getCfgList())
                end
            end
        elseif op == 'load' then
            if isfile and isfile(p) then
                local s, d = pcall(function()
                    return readfile(p)
                end)
                if s and d then
                    pcall(function()
                        Library.LoadConfig(d)
                    end)
                    task.defer(function()
                        if Library.Flags then
                            for theme, _ in pairs(Library.Theme) do
                                local flagKey = 'theme_' .. theme:lower():gsub(' ', '_')
                                if Library.Flags[flagKey] then
                                    Library.UpdateTheme(theme, Library.Flags[flagKey])
                                end
                            end
                        end
                    end)
                end
            end
        elseif op == 'del' then
            if isfile and isfile(p) then
                pcall(function()
                    delfile(p)
                end)
                if dd and dd.Refresh then
                    dd.Refresh(getCfgList())
                end
            end
        end
    end

    cs:Button({
        Name = 'save',
        Callback = function()
            cfgOp('save')
        end,
    })

    cs:Button({
        Name = 'load',
        Callback = function()
            cfgOp('load')
        end,
    })

    cs:Button({
        Name = 'overwrite',
        Callback = function()
            cfgOp('ovr')
        end,
    })

    cs:Button({
        Name = 'delete',
        Callback = function()
            cfgOp('del')
        end,
    })

    cs:Button({
        Name = 'refresh list',
        Callback = function()
            if dd and dd.Refresh then
                dd.Refresh(getCfgList())
            end
        end,
    })

    us:Keybind({
        Name = 'menu keybind',
        Key = Enum.KeyCode.RightControl,
        Mode = 'Toggle',
        Callback = function(v)
            if Window and Window.Open then
                Window:Open()
            end
        end,
        Flag = 'menu_keybind',
    })

    local watermarkToggle = us:Toggle({
        Name = 'watermark',
        Value = false,
        Callback = function(v)
            if Watermark and Watermark.SetVisible then
                Watermark.SetVisible(v)
            end
        end,
        Flag = 'watermark_enabled',
    })

    local watermarkPopup = watermarkToggle:Popup({Size = 200})

    local function updateWatermark()
        local text = 'brrr.lol'
        local types = Library.Flags.watermark_types
        if types and #types > 0 then
            for _, v in ipairs(types) do
                text = text .. ' | {' .. v .. '}'
            end
        end
        if Watermark and Watermark.SetText then
            Watermark.SetText(text)
        end
    end

    watermarkPopup:Slider({
        Name = 'update rate',
        Value = 200,
        Min = 0,
        Max = 1000,
        Float = 1,
        Suffix = '%s ms',
        Callback = function(v)
            Library.Flags.watermark_rate = v
            if Watermark and Watermark.SetRate then
                Watermark.SetRate(v / 1000)
            end
        end,
        Flag = 'watermark_rate',
    })

    watermarkPopup:Dropdown({
        Name = 'info types',
        Values = {'fps', 'ping', 'time', 'date', 'hour', 'minute', 'second', 'ap', 'month', 'day', 'year', 'game', 'n'},
        Value = {'game', 'time'},
        Multi = true,
        Callback = function(v)
            Library.Flags.watermark_types = v
            updateWatermark()
        end,
        Flag = 'watermark_types',
    })

    us:Toggle({
        Name = 'attach watermark',
        Value = true,
        Callback = function(v)
            if Watermark and Watermark.SetAttached then
                Watermark.SetAttached(v)
            end
        end,
        Flag = 'watermark_attached',
    })

    -- theme colorpickers — one per Library.Theme entry
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

    local gs = SettingsTab:Section({
        Name = 'game panel',
        Side = 'right',
    })

    gs:Button({
        Name = 'copy jobid',
        Callback = function()
            setclipboard(game.JobId)
        end,
    })

    gs:Button({
        Name = 'copy gameid',
        Callback = function()
            setclipboard(tostring(game.GameId))
        end,
    })

    gs:Button({
        Name = 'copy join script',
        Callback = function()
            setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ',"' .. game.JobId .. '",game.Players.LocalPlayer)')
        end,
    })

    gs:Button({
        Name = 'rejoin',
        Callback = function()
            local tps = game:GetService('TeleportService')
            tps:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end,
    })

    gs:Button({
        Name = 'join new server',
        Callback = function()
            local min, max = Library.Flags['srv_min'] or 1, Library.Flags['srv_max'] or 15
            local http = game:GetService('HttpService')
            local tps = game:GetService('TeleportService')

            local s, d = pcall(function()
                return http:JSONDecode(game:HttpGetAsync('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
            end)
            if not s then
                return
            end
            local valid = {}
            for _, srv in pairs(d.data) do
                if srv.playing >= min and srv.playing <= max then
                    table.insert(valid, srv)
                end
            end
            if #valid > 0 then
                tps:TeleportToPlaceInstance(game.PlaceId, valid[math.random(1, #valid)].id, LocalPlayer)
            end
        end,
    })

    gs:Slider({
        Name = 'min players',
        Value = 1,
        Min = 1,
        Max = 30,
        Float = 1,
        Callback = function() end,
        Flag = 'srv_min',
    })

    gs:Slider({
        Name = 'max players',
        Value = 15,
        Min = 1,
        Max = 30,
        Float = 1,
        Callback = function() end,
        Flag = 'srv_max',
    })
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
