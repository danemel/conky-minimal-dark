# conky-minimal-dark

Minimalistic Conky configuration for the right side of the screen. Designed to look good on dark backgrounds.

## Features

- Minimalistic system monitoring
- Right-aligned layout
- Icons and fonts
- Calendar integration
- Weather forecast

## Usage

1. **Copy the files** to your `~/.config/conky/` directory.
2. **Add your weather API key** in `weather_settings.lua`.
3. **Calendar:**  
   Make sure your system has the `cal` command. If not, install it:
   - **Debian/Ubuntu:**  
     `sudo apt install bsdmainutils`
   - **Fedora:**  
     `sudo dnf install util-linux`
   - **Arch:**  
     `sudo pacman -S util-linux`
4. **Fonts:**  
   Install [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) for fonts and icons.

## Weather Integration

> **Note:**  
> This repository does **not** include a weather API or script.  
> For weather data, sign up for a free API key at [openweathermap.org](https://openweathermap.org/), and configure `weather_settings.lua` accordingly.

## Tested On

This configuration was tested on **Pop!_OS**. 

## Screenshot
<img width="536" height="967" alt="Screenshot from 2025-08-08 19-31-38" src="https://github.com/user-attachments/assets/cf002f5b-6ab7-4f90-9e2a-2fafe61aefc2" />

