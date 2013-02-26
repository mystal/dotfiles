platform="unknown"
unamestr=`uname`
if [[ $unamestr == "Linux" ]]; then;
    platform="linux"
elif [[ $unamestr == "Darwin" ]]; then;
    platform="osx"
fi

export EDITOR=vim
export SVN_EDITOR=vim

if [[ $platform == "osx" ]]; then;
    #For development tools
    export PATH="/Developer/usr/bin:${PATH}"
    #For CUDA
    export PATH="/usr/local/cuda/bin:${PATH}"
    export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:${DYLD_LIBRARY_PATH}"
    #For Homebrew
    export PATH="${HOME}/.homebrew/bin:${HOME}/.homebrew/sbin:${PATH}"
fi

#For Google Go
export GOPATH="${HOME}/.gopath"
export PATH="${GOPATH}/bin:${PATH}"
