export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash
fi

eval "$(pyenv init --path)"
eval "$(pyenv init - --no-rehash)"

