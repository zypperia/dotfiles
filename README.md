# Installing
```sh
apk add coreutils shadow xz bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl
nix-channel --update

nix-shell '<home-manager>' -A install
nix-env -iA nixgl.auto.nixGLDefault
```