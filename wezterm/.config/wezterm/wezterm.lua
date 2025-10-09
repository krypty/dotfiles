-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Gruvbox light, medium (base16)'
config.color_scheme = "Gruvbox (Gogh)"

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.window_close_confirmation = "NeverPrompt"

config.enable_tab_bar = false

-- FIXME: remove this
config.enable_wayland = false

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

config.font_size = 11.0

-- Key bindings for increasing and decreasing font size
config.keys = {
    {
        key = "PageUp",
        mods = "ALT",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        key = "PageDown",
        mods = "ALT",
        action = wezterm.action.DecreaseFontSize,
    },
    {
        key = "0",
        mods = "ALT",
        action = wezterm.action.ResetFontSize,
    },
}

local act = wezterm.action
-- disable all default mouse assignments and only define ours
config.disable_default_mouse_bindings = true
-- from documentation: You can bypass the mouse reporting capture by holding
-- down the SHIFT key; that will prevent the event from being passed to the
-- application and allow matching it against your assignments as though the
-- SHIFT key were not pressed.
--
-- Make Shift-Click open hyperlinks (Shift is implied)
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = act.OpenLinkAtMouseCursor,
    },
}

-- and finally, return the configuration to wezterm
return config
