# Hyprland Screen Sharing Setup

Step-by-step guide to getting screen sharing (xdg-desktop-portal) working under Hyprland
by starting the portals through a proper systemd user session target.

## 1. Remove the old portal override

Delete the systemd drop-in that overrides `xdg-desktop-portal.service`, along with its folder:

```sh
rm -r ~/.config/systemd/user/xdg-desktop-portal.service.d
```

For reference, the removed `override.conf` contained:

```ini
[Unit]
ConditionEnvironment=WAYLAND_DISPLAY
Requisite=
BindsTo=
PartOf=
After=
```

## 2. Create a Hyprland session target

Create `~/.config/systemd/user/hyprland-session.target`:

```ini
[Unit]
Description=Hyprland session
BindsTo=graphical-session.target
Wants=graphical-session-pre.target
After=graphical-session-pre.target
```

This ties `graphical-session.target` (and with it, the portals) to the Hyprland session.

## 3. Update the Hyprland startup commands

Open `~/.config/hypr/hyprland.lua` and find the `hyprland.start` block.

Remove these four lines:

```lua
hl.exec_cmd("systemctl --user reset-failed")
hl.exec_cmd("/usr/lib/xdg-desktop-portal --replace &")
hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_cmd("systemctl --user start graphical-session.target")
```

Replace them with this single line:

```lua
hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE DISPLAY && systemctl --user start hyprland-session.target")
```

This exports the session environment to systemd/D-Bus and then starts the session target,
which brings up `graphical-session.target` and the portals.

## 4. Apply the changes to the current session (no logout needed)

Run these in a terminal inside Hyprland:

```sh
systemctl --user daemon-reload
systemctl --user reset-failed
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE DISPLAY
systemctl --user start hyprland-session.target
```

These only affect the current session. From the next login on, step 3 handles this automatically.

## 5. Verify

```sh
systemctl --user status hyprland-session.target graphical-session.target
systemctl --user status xdg-desktop-portal xdg-desktop-portal-hyprland
```

All units should be `active`. Then test screen sharing in a browser or video-call app.

## Optional: Flatpak keyring fix

If Flatpak apps have keyring/secret issues, you can additionally create
`~/.config/xdg-desktop-portal/hyprland-portals.conf`. This is not required for screen sharing.
