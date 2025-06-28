PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null); PS1_CMD2=$()'; PS1='\[\e[91;1m\]\u\[\e[0m\] \[\e[93m\]at\[\e[0m\] \[\e[92;1m\]\H\[\e[0m\] \[\e[96m\]in\[\e[0m\] \[\e[94;1m\]\w\[\e[0m\] \[\e[95m\]${PS1_CMD1}\[\e[0m\] \n\[\e[92m\]\\$\[\e[0m\] \[\e]0;${PS1_CMD2}\a\]'

eval "$(fzf --bash)"

# Android SDK
# Check if the Android SDK directory exists in the user's home directory.
if [ -d "$HOME/Android/Sdk" ]; then
    export ANDROID_HOME=$HOME/Android/Sdk # If the directory exists, set the ANDROID_HOME environment variable to the path of the SDK.
    export PATH=$PATH:$ANDROID_HOME/platform-tools # Add the platform-tools directory to the PATH environment variable so that adb and fastboot can be run from any directory.
    export PATH=$PATH:$ANDROID_HOME/emulator # Add the emulator directory to the PATH environment variable so that the Android emulator can be run from any directory.
    export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin # Add the cmdline-tools/latest/bin directory to the PATH environment variable so that sdkmanager and avdmanager can be run from any directory.
fi

# Flutter SDK
# Check if the Flutter SDK directory exists in the user's home directory.
if [ -d "$HOME/flutter/bin" ]; then
    export PATH="$PATH:$HOME/flutter/bin" # Add the Flutter SDK directory to the PATH environment variable so that flutter can be run from any directory.
fi

# Check if the Bitwarden SSH Agent socket exists
# If it does, export SSH_AUTH_SOCK to use the Bitwarden SSH Agent
if [ -e "$HOME/.bitwarden-ssh-agent.sock" ]; then
    export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
fi

# Check if the Miniconda installation exists in the user's home directory
if [ -d "$HOME/miniconda3" ]; then
    # If the conda.sh script exists, source it to enable conda commands
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

# Check if the FNM (Fast Node Manager) directory exists in the user's home directory
# If it does, add it to the PATH and initialize FNM
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
  eval "$(fnm env --use-on-cd --shell bash)"
fi
