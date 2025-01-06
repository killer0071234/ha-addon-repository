# ha-addon-repository

![Project Stage][project-stage-shield]
![Maintenance][maintenance-shield]
[![License][license-shield]](LICENSE.md)

Daniel's Addons for [http://home-assistant.io](http://home-assistant.io)

Created by [Daniel Gangl][killer0071234].

# Installation
Simply click this button:

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fkiller0071234%2Fha-addon-repository)

or to install manually simply add this to Home Assistant Add-on repository:

```txt
https://github.com/killer0071234/ha-addon-repository
```

## Add-ons provided by this repository

### &#10003; [CybroScgiServer][addon-cybroscgiserver]

![Latest Version][cybroscgiserver-version-shield]
![Supports armhf Architecture][cybroscgiserver-armhf-shield]
![Supports armv7 Architecture][cybroscgiserver-armv7-shield]
![Supports aarch64 Architecture][cybroscgiserver-aarch64-shield]
![Supports amd64 Architecture][cybroscgiserver-amd64-shield]
![Supports i386 Architecture][cybroscgiserver-i386-shield]

SCGI serer to communicate to PLCs from Cybrotech / Robotina

[:books: CybroScgiServer add-on documentation][addon-doc-cybroscgiserver]

## Releases

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You could open an issue here on GitHub. Note, we use a separate
GitHub repository for each add-on. Please ensure you are creating the issue
on the correct GitHub repository matching the add-on.

- [Open an issue for the add-on: CybroScgiServer][cybroscgiserver-issue]

For a general repository issue or add-on ideas [open an issue here][issue]

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Adding a new add-on

We are currently not accepting third party add-ons to this repository.

For questions, please contact [Daniel Gangl][killer0071234]:

- Drop him an email: killer007@gmx.at

## License

MIT License

Copyright (c) 2022-2024 Daniel Gangl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Credits

Code template was mainly from [hassio-repo][hassio-repo]

[addon-cybroscgiserver]: https://github.com/killer0071234/hassio-cybroscgiserver/tree/v0.2.4
[addon-doc-cybroscgiserver]: https://github.com/killer0071234/hassio-cybroscgiserver/blob/v0.2.4/README.md
[cybroscgiserver-issue]: https://github.com/killer0071234/hassio-cybroscgiserver/issues
[cybroscgiserver-version-shield]: https://img.shields.io/badge/version-v0.2.4-blue.svg
[cybroscgiserver-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[cybroscgiserver-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[cybroscgiserver-armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[cybroscgiserver-armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[cybroscgiserver-i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

[hassio-repo]: https://github.com/hassio-addons/repository
[license-shield]: https://img.shields.io/github/license/killer0071234/ha-addon-repository.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[add_addon_repo]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fkiller0071234%2Fha-addon-repository
[add_addon-repo-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[killer0071234]: https://github.com/killer0071234
[issue]: https://github.com/killer0071234/ha-addon-repository/issues
[semver]: http://semver.org/spec/v2.0.0.html