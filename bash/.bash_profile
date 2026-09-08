# Homebrew
eval "$(/usr/local/bin/brew shellenv)"

# Python 3.8 (installeur python.org)
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Mole shell completion
if output="$(mole completion bash 2>/dev/null)"; then eval "$output"; fi

# Binaires utilisateur (priorité la plus haute)
export PATH="$HOME/.local/bin:$PATH"
