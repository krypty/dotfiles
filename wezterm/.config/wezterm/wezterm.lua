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
-- custom build: I reverted https://github.com/wezterm/wezterm/pull/6508/files
function getHostname()
    local f = io.popen("/bin/hostname")
    local hostname = f:read("*a") or ""
    f:close()
    hostname = string.gsub(hostname, "\n$", "")
    return hostname
end

local hostname = getHostname()
if hostname == "tower" then
    config.enable_wayland = false
    FONT_SIZE = 12
else
    config.enable_wayland = true
    FONT_SIZE = 10
end

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

config.font_size = FONT_SIZE
config.font = wezterm.font_with_fallback({
    "DejaVu Sans Mono",
})
config.font_rules = {
    {
        intensity = "Bold",
        italic = false,
        font = wezterm.font("DejaVu Sans Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
    },
    {
        intensity = "Bold",
        italic = true,
        font = wezterm.font("DejaVu Sans Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
    },
}

config.keys = {
    -- Key bindings for increasing and decreasing font size
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
    -- -- Key bindings to scroll up/down to the previous/next prompt
    -- {
    --     key = "UpArrow",
    --     mods = "SHIFT",
    --     action = wezterm.action.ScrollToPrompt(-1),
    -- },
    -- {
    --     key = "DownArrow",
    --     mods = "SHIFT",
    --     action = wezterm.action.ScrollToPrompt(1),
    -- },
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
    -- {
    --     event = { Down = { streak = 3, button = "Left" } },
    --     action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
    -- },
}

-- and finally, return the configuration to wezterm
return config
