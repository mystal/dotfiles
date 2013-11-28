platform="unknown"
unamestr=`uname`
if [[ $unamestr == "Linux" ]]; then
    platform="linux"
elif [[ $unamestr == "Darwin" ]]; then
    platform="osx"
fi

export EDITOR=vim
export SVN_EDITOR=vim

if [[ $platform == "linux" ]]; then
    #Java, stop looking so ugly
    export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
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
