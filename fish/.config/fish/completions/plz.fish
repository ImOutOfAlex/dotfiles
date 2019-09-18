#!/usr/bin/env fish

function __fish_plz_needs_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -eq 1
        return 0
    end
    return 1
end

function __fish_plz_using_command -a current_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -gt 1
        if test $current_command = $cmd[2]
            return 0
        end
    end
    return 1
end

function __fish_plz_arg_number -a number
    set -l cmd (commandline -opc)
	test (count $cmd) -eq $number
end

function __fish_plz_arg_at -a number
    set -l cmd (commandline -opc)
	echo $cmd[$number]
end

# What to build and how to build it
complete -f -c plz -n '__fish_plz_needs_command' -s '-c' -o '--config=' -d "Build config to use. Defaults to opt. [$PLZ_BUILD_CONFIG]"
complete -f -c plz -n '__fish_plz_needs_command' -s '-a' -o '--arch=' -d "Architecture to compile for."
complete -f -c plz -n '__fish_plz_needs_command' -s '-r' -o '--repo_root=' -d "Root of repository to build."
complete -f -c plz -n '__fish_plz_needs_command' -s '-n' -o '--num_threads=' -d "Number of concurrent build operations. Default is number of CPUs + 2."
complete -f -c plz -n '__fish_plz_needs_command' -s '-i' -o '--include=' -d "Label of targets to include in automatic detection."
complete -f -c plz -n '__fish_plz_needs_command' -s '-e' -o '--exclude=' -d "Label of targets to exclude from automatic detection."
complete -f -c plz -n '__fish_plz_needs_command' -s '-o' -o '--override=' -d "Options to override from .plzconfig (e.g. -o please.selfupdate:false) [$PLZ_OVERRIDES]"
complete -f -c plz -n '__fish_plz_needs_command' -o '--profile=' -d "Configuration profile to load; e.g. --profile=dev will load .plzconfig.dev if it exists. [$PLZ_CONFIG_PROFILE]"

# Output and logging

# Enable / Disable certain features

# Help
complete -f -c plz -n '__fish_plz_needs_command' -s '-h' -o '--help' -d "Show help message"
complete -f -c plz -n '__fish_plz_needs_command' -o '--version' -d "Print the version of please"


# build
complete -f -c plz -n '__fish_plz_needs_command' -a build -d "Builds one or more targets"
complete -f -c plz -n '__fish_plz_using_command build' -a '(plz query alltargets 2>/dev/null)' -d "Targets to build"
complete -f -c plz -n '__fish_plz_using_command build' -o '--prepare' -d "Prepare build directory for these targets but don't build them."
complete -f -c plz -n '__fish_plz_using_command build' -o '--shell' -d "Like --prepare, but opens a shell in the build directory with the appropriate environment variables."
complete -f -c plz -n '__fish_plz_using_command build' -o '--rebuild' -d "To force the optimisation and rebuild one or more targets."

# clean
complete -f -c plz -n '__fish_plz_needs_command' -a clean -d "Cleans build artifacts"
complete -f -c plz -n '__fish_plz_using_command clean' -s '-f' -o '--nobackground' -d "Don't fork & detach until clean is finished."
complete -f -c plz -n '__fish_plz_using_command clean' -o '--remote' -d "Clean entire remote cache when no targets are given (default is local only)"
complete -f -c plz -n '__fish_plz_using_command clean' -a '(plz query alltargets 2>/dev/null)' -d "Targets to clean (default is to clean everything)"

complete -f -c plz -n '__fish_plz_needs_command' -a cover -d "Builds and tests one or more targets, and calculates coverage."
complete -f -c plz -n '__fish_plz_needs_command' -a export -d "Exports a set of targets and files from the repo."
complete -f -c plz -n '__fish_plz_needs_command' -a follow -d "Connects to a remote Please instance to stream build events from."
complete -f -c plz -n '__fish_plz_needs_command' -a gc -d "Analyzes the repo to determine unneeded targets."
complete -f -c plz -n '__fish_plz_needs_command' -a hash -d "Calculates hash for one or more targets"
complete -f -c plz -n '__fish_plz_needs_command' -a help -d "Displays help about various parts of plz or its build rules (aliases: halp)"
complete -f -c plz -n '__fish_plz_using_command help' -a '(plz help topics | tail +5)' -d "Displays help about a topic."
complete -f -c plz -n '__fish_plz_using_command halp' -a '(plz help topics | tail +5)' -d "Displays help about a topic."
complete -f -c plz -n '__fish_plz_needs_command' -a ide -d "IDE Support and generation."
complete -f -c plz -n '__fish_plz_needs_command' -a init -d "Initialises a .plzconfig file in the current directory"
complete -f -c plz -n '__fish_plz_needs_command' -a op -d "Re-runs previous command."
complete -f -c plz -n '__fish_plz_needs_command' -a query -d "Queries information about the build graph"
complete -f -c plz -n '__fish_plz_needs_command' -a run -d "Builds and runs a single target"
complete -f -c plz -n '__fish_plz_needs_command' -a test -d "Builds and tests one or more targets"
complete -f -c plz -n '__fish_plz_needs_command' -a update -d "Checks for an update and updates if needed."
complete -f -c plz -n '__fish_plz_needs_command' -a watch -d "Watches sources of targets for changes and rebuilds them"
