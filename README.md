# pup-golang

[sheepdoge](https://github.com/mattjmcnaughton/sheepdoge) pup for managing
golang.

## Variables

- `pup_golang_main_dotfile`: The dotfile in which to configure GOPATH.
- `pup_golang_main_gopath`: The GOPATH.
- `pup_golang_main_go_bins`: A list of go binaries to install.
- `pup_golang_main_go_deleted_bins`: A list of binaries to ensure are not
  installed.

## Requirements

If you do not already have `go` installed, you will need either `homebrew` or
`python-apt` (depending on your OS).
