if [[ ! "$OSTYPE" == "darwin"* ]]; then
    echo "This is not a macOS system."
else
    # Homebrew
    if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi