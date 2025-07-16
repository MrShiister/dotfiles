(
    echo The install-packages script is not run as it is currently not supported on Windows.
    echo Consider installing the following from choco:
    echo.
    echo choco install chezmoi neovim lazygit fzf ripgrep fd git gh mingw
    echo.
    echo Symlink the configurations to %APPDATA%
    echo.
    echo New-Item -Path $env:LOCALAPPDATA\nvim -ItemType SymbolicLink -Value $env:HOME\.config\nvim\
    echo New-Item -Path $env:LOCALAPPDATA\lazygit -ItemType SymbolicLink -Value $env:HOME\.config\lazygit\
)
