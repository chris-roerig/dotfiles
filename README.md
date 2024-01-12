# Vim Configuration Setup

This repository contains a custom Vim configuration that enhances your Vim experience for programming. It includes popular plugins for code completion, syntax highlighting, linting, and more.
Installation

## Prerequisites:

Before proceeding, ensure you have the following prerequisites installed on your system:

* Vim: Make sure you have Vim installed. You can check this by running vim --version in your terminal.
* Git: You'll need Git to clone this repository. You can install Git by following the instructions on the official Git website.

## Installation Steps:

Install Vundle (the plugin manager used in this configuration):

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open Vim and run the following command to install the configured plugins:

```
:PluginInstall
```

Wait for the plugins to install. You may see some messages about plugin installation progress.

After the installation is complete, restart Vim.

Configuration Details:

This Vim configuration includes the following plugins:

* YouCompleteMe (YCM) for advanced code completion.
* vim-cpp-enhanced-highlight for enhanced C++ syntax highlighting.
* ALE (Asynchronous Lint Engine) for linting and syntax checking.
* vala.vim for Vala language support.
* vim-go for Go language support.
* rust.vim for Rust language support.
* nerdcommenter for easy code commenting.
* vim-colorschemes for a collection of color schemes.
* vim-gitgutter to show git diff in the gutter.
* mru for a most recently used files list.
* ctrlp.vim for a full path fuzzy file finder.
* BufOnly.vim to close all buffers but the current one.
* vim-endwise to automatically close blocks and statements.
* undotree to visualize Vim's undo history.
* vim-css-color for CSS color previewing.

Additional custom settings and key mappings are provided in the vimrc file.

## Usage

After installation, open Vim and start using the enhanced features provided by this configuration.

Refer to the comments in the vimrc file for information on custom key mappings and settings.

### Installing and Configuring YouCompleteMe (YCM)

YouCompleteMe (YCM) provides advanced code completion capabilities. To make the most of YCM, follow these steps:

#### Installation:

Make sure you have Python 3 installed on your system and navigate to the YCM directory:

```
cd ~/.vim/bundle/YouCompleteMe
```

Run the YCM installer script:

```
python3 install.py --all
```

This will compile YCM with support for various languages.

#### Configuration:

YCM requires a configuration file named .ycm_extra_conf.py in your project's directory. This file specifies the compilation flags and settings for YCM to work correctly.

In your Vim project, create a .ycm_extra_conf.py file with the appropriate configuration for your project. Here's an example configuration:

```
import os
import ycm_core

flags = [
    '-std=c++17',  # Adjust the C++ version as needed
    '-I/path/to/modules',  # Path to the modules folder (if needed)
    '-I/path/to/includes',  # Path to your project's include directory (if needed)
]

def FlagsForFile(filename, **kwargs):
    final_flags = flags
    return {
        'flags': final_flags,
        'do_cache': True
    }
```

Replace yourusername and adjust the flags accordingly for your project.

YCM should now work with your project, providing code completion as you type.

### Installing and Configuring ShellCheck (Bash Linter)

ShellCheck is used to lint Bash scripts. Follow these steps to set it up:

#### Installation (Linux):

Install ShellCheck using your system's package manager. For example, on Fedora:

```
sudo dnf install ShellCheck
```

#### Configuration:

The Vim configuration already includes settings for ShellCheck. When editing Bash scripts, ALE (Asynchronous Lint Engine) will automatically use ShellCheck for linting.


### Installing and Configuring ALE (Linting and Syntax Checking)

ALE (Asynchronous Lint Engine) is used for linting and syntax checking in Vim. Follow these steps to set it up and configure it for different languages:

#### Installation:

For Linux (Fedora/RHEL):

You can use the dnf package manager to install ALE:

```
sudo dnf install vim-ale
```

For macOS (Homebrew):

If you're using Homebrew on macOS, you can install ALE using the following command:

```
brew install vim-ale
```

#### Configuration:

ALE is configured to work with various programming languages in the Vim configuration provided. Here's how to configure specific linters for different languages:

    C and C++ (Clang):
        ALE is configured to use Clang for linting C and C++ files.

    Python (Pylint):

        Ensure you have Python installed.

        ALE uses Pylint for linting Python files. You can configure Pylint settings in your Python project by creating a .pylintrc file.

    Go (golangci-lint):

        Ensure you have Go installed.

        ALE uses golangci-lint for linting Go files. You can configure golangci-lint settings in your Go project by creating a .golangci.yml file.

    JavaScript (ESLint):

        Ensure you have Node.js and npm installed.

        ALE uses ESLint for linting JavaScript files. You can configure ESLint settings in your JavaScript project by creating an .eslintrc.js or .eslintrc.json file.

    Ruby (Rubocop):

        Ensure you have Ruby installed.

        ALE uses Rubocop for linting Ruby files. You can configure Rubocop settings in your Ruby project by creating a .rubocop.yml file.

    Vala (Valac):
        ALE is configured to use Valac for linting Vala files.

    Bash (ShellCheck):
        ALE is configured to use ShellCheck for linting Bash scripts. Install ShellCheck using your system's package manager (e.g., sudo dnf install ShellCheck on Fedora).

ALE should automatically detect the appropriate linters based on the file types you're working with. If needed, customize the linter settings in your project's configuration files (e.g., .pylintrc, .eslintrc.js, etc.).
ALE will provide linting and syntax checking as you edit your code in Vim, highlighting errors and warnings for you to address.

