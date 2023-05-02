#!/usr/bin/env bash

if ! command -v nix &> /dev/null
then
  echo "Install NIX! https://nixos.wiki/wiki/Nix_Installation_Guide"
  exit 1
fi

if ! command -v home-manager &> /dev/null
then
  echo "Install Home Manager! https://rycee.gitlab.io/home-manager/index.html#ch-installation"
  exit 1
fi

home-manager switch

