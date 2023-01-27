# binaries

## How to update my drv configuration

- udpate nvim configuration
	- see [nvim-drv](https://gitlab.com/kyger/nvim-drv)
- remove dirs:
	- `~/AppData/Local/nvim-data`
	- `~/AppData/Local/coc`
	- `~/AppData/Local/Programs/Python/Python310/Lib/site-packages`
- execute [scripts/archive.sh](scripts/archive.sh)
- zip tarballs and push release
- extract in drv and have fun :)

