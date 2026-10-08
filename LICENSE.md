# piruetas bote License and Copyright Notices

bote is (c) 2026 by piruetas SpA / Aarón Montoya-Moraga.

Full license texts are included in the `./LICENSES` folder.

This notice must be included in any distributions of this project or derivative works.

Since this project consists of many different layers, individual parts of the project are made available under different licenses.

1. Factory setup scripts (`./factory`): Not applicable to this project. When present, available under the MIT license (SPDX: MIT). Full text available at <https://opensource.org/licenses/MIT>
2. Firmware (`./firmware`): Not applicable to this project. When present, available under the MIT license (SPDX: MIT), with the exception of third-party code located in `./firmware/third_party`. Please read `./firmware/LICENSE` for a complete listing of terms.
3. Functional hardware designs (`./hardware`): The OpenSCAD source files of the case and the exported `.stl` files are available under the CERN Open Hardware Licence Version 2 - Permissive (SPDX: CERN-OHL-P-2.0). Full text available at <https://cern.ch/cern-ohl>
4. Panel design (`./panel`): Not applicable to this project. When present, available under Creative Commons Attribution-ShareAlike 4.0 International (SPDX: CC-BY-SA-4.0). Full text available at <https://creativecommons.org/licenses/by-sa/4.0/>
5. User's guide and documentation (`./docs` and `README.md`): Available under Creative Commons Attribution-ShareAlike 4.0 International (SPDX: CC-BY-SA-4.0). Full text available at <https://creativecommons.org/licenses/by-sa/4.0/>
6. Logo and branding (`./branding`): The piruetas name, logo, and branding are used throughout this project. They are (c) piruetas SpA / Aarón Montoya-Moraga, all rights reserved, and are not covered by the open source licenses above (SPDX: LicenseRef-piruetas-branding). You may not distribute derivative works or products bearing the piruetas logo or branding. Derivative works should remove piruetas branding and use their own name and logo. You may use the piruetas name in plain text to accurately describe the origin of a derivative work, for example "based on bote by piruetas". Full text available at `./LICENSES/LicenseRef-piruetas-branding.txt`
7. Development scripts (`./scripts` and `./.githooks`): Available under the MIT license (SPDX: MIT). Full text available at `./LICENSES/MIT.txt`

8. Shared library (`./terceros/popusintes-cajas-paneles`): A git submodule pointing to [popusintes-cajas-paneles](https://github.com/piruetasxyz/popusintes-cajas-paneles), which provides the Eurorack constants and the shared OpenSCAD functions and modules used by bote. It is (c) 2026 piruetas, is a separate repository, and is available under its own license, the MIT license (SPDX: MIT). See the `LICENSE` file inside that repository.
