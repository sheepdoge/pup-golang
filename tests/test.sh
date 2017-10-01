#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml
}

test::assert_output() {
  echo 'TODO'
}

test::check_syntax
test::run_ansible
test::assert_output
