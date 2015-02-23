function parse_ostype {
    case "$OSTYPE" in
        solaris*) echo "solaris" ;;
        darwin*)  echo "osx" ;;
        linux*)   echo "linux" ;;
        bsd*)     echo "bsd" ;;
        *)        echo "unknown" ;;
    esac
}

platform=$(parse_ostype)

if type termite &> /dev/null; then
    export TERMINAL=termite
elif type terminology &> /dev/null; then
    export TERMINAL=terminology
fi

export VISUAL=vim
export EDITOR=vim
export SVN_EDITOR=vim

if [[ $platform == "linux" ]]; then
    #Java, stop looking so ugly
    export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
    export PATH="${HOME}/Programming/hugo:${PATH}"
fi

if [[ $platform == "osx" ]]; then
    #For development tools
    export PATH="/Developer/usr/bin:${PATH}"
    #For CUDA
    export PATH="/usr/local/cuda/bin:${PATH}"
    export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:${DYLD_LIBRARY_PATH}"
    #For Homebrew
    export PATH="${HOME}/.homebrew/bin:${HOME}/.homebrew/sbin:${HOME}/.homebrew/share/python:${PATH}"
    #For Haskell
    export PATH="${HOME}/Library/Haskell/bin:${PATH}"
    #For Android
    export PATH="${HOME}/Programming/android-sdk-macosx/tools:${PATH}"
    export PATH="${HOME}/Programming/android-sdk-macosx/platform-tools:${PATH}"
    export ANDROID_HOME="${HOME}/Programming/android-sdk-macosx"
fi

#For Google Go
export GOPATH="${HOME}/.gopath"
export PATH="${GOPATH}/bin:${PATH}"
