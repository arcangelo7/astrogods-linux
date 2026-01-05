# AstroGods

Open source Flutter frontend for [AstroGods](https://astrogods.it).

AstroGods is a modern, beautifully designed Astrology app focused on self-knowledge. It provides personalized birth chart interpretations, synastry analysis for relationships, and transit readings.

https://github.com/user-attachments/assets/27aaa5fc-46b9-4fa5-90dc-c4479c725b5e

<p align="center">
  <img src="screenshots/1000x700/homepage_dark.png" width="45%" alt="Homepage" />
  <img src="screenshots/1000x700/birth_chart_dark.png" width="45%" alt="Birth chart" />
</p>
<p align="center">
  <img src="screenshots/1000x700/book_of_caverns_dark.png" width="45%" alt="Synastry" />
  <img src="screenshots/1000x700/forecast_dark.png" width="45%" alt="Forecast" />
</p>

## Features

- In-depth birth chart interpretations using Egyptian astrology (Equal house system with Vehlow domification)
- Synastry analysis for relationships
- Daily and monthly transit readings
- Available in English and Italian

## Installation

This repository was created to facilitate publication on Flathub and currently provides pre-built binaries for Linux only. Since this is a Flutter project, the source code can theoretically be compiled for other platforms (Android, iOS, macOS, Windows, Web).

### Flatpak

AstroGods has been submitted to [Flathub](https://flathub.org) and is pending review. Track the progress in [PR #7474](https://github.com/flathub/flathub/pull/7474).

### Pre-built binaries

Download the latest release for your architecture from [Releases](https://github.com/arcangelo7/astrogods-app/releases):

- `linux-x64-*.tar.gz` for Intel/AMD processors
- `linux-arm64-*.tar.gz` for ARM processors

```bash
tar -xzf linux-*.tar.gz
cd linux-*/
./astrogods
```

## License

This project is licensed under the [GNU Affero General Public License v3.0](LICENSE).

This repository contains the frontend. The backend is proprietary.

## Links

- Website: https://astrogods.it