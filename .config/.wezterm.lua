-- Pull in the wezterm API
local theme_name = "Everforest Dark Hard (Gogh)"
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

-- This is where you actually apply your config choices.
config.font = wezterm.font("BlexMono Nerd Font Mono")
config.font_size = 14

config.color_scheme = theme_name

config.tab_max_width = 64

-- set startup window size to fullscreen
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.initial_rows = 28
-- config.initial_cols = 120

-- use powershell as the default shell on Windows
config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }

-- add other shell
config.launch_menu = {
	{
		label = "WSL",
		args = { "wsl.exe" },
	},
	{
		label = "Command Prompt (CMD)",
		args = { "cmd.exe" },
	},
	{
		label = "Azure CLI (PowerShell)",

		args = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoProfile", "-Command", "az login; Get-AzContext" },
	},
}

config.keys = {
	-- show launcher
	{
		key = "N",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ShowLauncher,
	},
}

wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- tab config

config.use_fancy_tab_bar = true

-- powerline separators from Nerd Fonts
local UPPER_LEFT_TRIANGLE = wezterm.nerdfonts.ple_upper_left_triangle
local LOWER_RIGHT_TRIANGLE = wezterm.nerdfonts.ple_lower_right_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	local cwd_uri = tab.active_pane.current_working_dir

	-- 	local background = "#414B50" -- Normal tab background
	-- 	local foreground = "#9DA9A0" -- Normal tab foreground
	--
	-- 	local active_background = "#A7C080" -- Active tab background
	-- 	local active_foreground = "#1E2326" -- Active tab foreground
	--
	-- 	local hover_background = "#374145" -- Hover tab background
	--
	-- 	-- Initialize separator colors
	-- 	local edge_background = background
	--
	-- 	if tab.is_active then
	-- 		background = active_background
	-- 		foreground = active_foreground
	-- 	elseif hover then
	-- 		background = hover_background
	-- 	end
	--
	if cwd_uri then
		local cwd = cwd_uri.file_path
		if cwd then
			-- Just show the last directory name
			local project = cwd:match("([^/]+)/*$")
			if project then
				title = project
			end
		end
	end
	--
	-- 	local edge_fg = background
	--
	-- 	-- figure out first and last tab
	-- 	local is_first = (tab.tab_index == 0)
	-- 	local is_last = (tab.tab_index == #tabs - 1)
	--
	-- 	local result = {}
	--
	-- 	-- only draw left separator if not the first tab
	-- 	if not is_first then
	-- 		table.insert(result, { Foreground = { Color = edge_fg } })
	-- 		table.insert(result, { Background = { Color = edge_background } })
	-- 		table.insert(result, { Text = LOWER_RIGHT_TRIANGLE })
	-- 	end
	--
	-- 	-- tab content
	-- 	table.insert(result, { Background = { Color = background } })
	-- 	table.insert(result, { Foreground = { Color = foreground } })
	-- 	table.insert(result, { Text = " " .. title .. " " })
	--
	-- 	-- only draw right separator if not the last tab
	-- 	if not is_last then
	-- 		table.insert(result, { Foreground = { Color = edge_fg } })
	-- 		table.insert(result, { Background = { Color = edge_background } })
	-- 		table.insert(result, { Text = UPPER_LEFT_TRIANGLE })
	-- 	end
	--
	return {
		{ Text = " " .. title .. " " }
	}
end)

-- tabline.setup({
-- 	options = {
-- 		theme = theme_name,
-- 		tab_separators = {
-- 			right = wezterm.nerdfonts.ple_left_hard_divider_inverse,
-- 		},
-- 	},
-- 	sections = {
-- 		tabline_a = {},
-- 		tabline_b = { "workspace" },
-- 		tabline_c = {},
-- 		tab_active = {
-- 			"index",
-- 			wezterm.nerdfonts.pl_left_soft_divider,
-- 			{ "process", padding = { left = 1, right = 1 } },
-- 			{ "zoomed", padding = 0 },
-- 		},
-- 		tab_inactive = {
-- 			"index",
-- 			wezterm.nerdfonts.pl_left_soft_divider,
-- 			{ "cwd", max_length = 20 },
-- 		},
-- 		tabline_y = { { "datetime", style = "%d-%m-%Y %H:%M" } },
-- 	},
-- })

-- config padding
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Finally, return the configuration to wezterm:
return config
