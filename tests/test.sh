#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"dotfile": "~/.bashrc", "gopath": "/go", "go_bins": ["golang.org/x/tools/...", "github.com/golang/lint/golint"], "go_deleted_bins": []}' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost' -e '{"dotfile": "~/.bashrc", "gopath": "/go", "go_bins": ["golang.org/x/tools/...", "github.com/golang/lint/golint"], "go_deleted_bins": []}'
}

test::assert_output() {
  . ~/.bashrc

  if ! which go >/dev/null; then
    echo 'go is not installed'
    exit 1
  fi

  if ! echo $PATH | grep -q "$GOPATH/bin"; then
    echo "$GOPATH/bin not included in $PATH"
    exit 1
  fi

  if ! which golint >/dev/null; then
    echo "golint is not installed"
    exit 1
  fi

  # Assert when we source ~/.bashrc again, we only write $GOPATH/bin to $PATH
  # once
  . ~/.bashrc

  if [ ":$PATH:" == "*:$GOPATH/bin:*:$GOPATH/bin:*" ]; then
    echo "$GOPATH/bin written to $PATH to often"
    exit 1
  fi
}

test::check_syntax
test::run_ansible
test::assert_output
