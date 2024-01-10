#!/bin/bash

case "$1" in
    "--help")
        # Display help information
        echo "internsctl - Custom Linux Command for Operations"
        echo "Usage: internsctl [options]"
        echo "Options:"
        echo "  --help      Display this help message"
        echo "  --version   Display command version"
        echo "  cpu getinfo Get CPU information"
        echo "  memory getinfo Get memory information"
        echo "  user create <username> Create a new user"
        echo "  user list [--sudo-only] List users"
        echo "  file getinfo [options] <file-name> Get file information"
        echo "    Options:"
        echo "      --size, -s          Print file size"
        echo "      --permissions, -p   Print file permissions"
        echo "      --owner, -o         Print file owner"
        echo "      --last-modified, -m Print last modified time"
        ;;
    "--version")
        # Display version information
        echo "internsctl v0.1.0"
        ;;
    "cpu"|"memory")
        # Execute CPU and memory commands
        case "$2" in
            "getinfo")
                if [ "$1" == "cpu" ]; then
                    lscpu
                elif [ "$1" == "memory" ]; then
                    free
                fi
                ;;
            *)
                echo "Invalid subcommand for $1"
                ;;
        esac
        ;;
    "user")
        # Execute user commands
        case "$2" in
            "create")
                if [ -z "$3" ]; then
                    echo "Please provide a username for user creation"
                else
                    sudo adduser "$3"
                fi
                ;;
            "list")
                if [ "$3" == "--sudo-only" ]; then
                    getent passwd | cut -d: -f1,3,4 | awk -F: '$2 >= 1000 { print $1 }'
                else
                    getent passwd | cut -d: -f1
                fi
                ;;
            *)
                echo "Invalid subcommand for user"
                ;;
        esac
        ;;
    "file")
        # Execute file commands
        case "$2" in
            "getinfo")
                if [ -z "$3" ]; then
                    echo "Please provide a file name"
                else
                    file_name="$3"
                    case "$4" in
                        "--size"|-s)
                            stat -c %s "$file_name"
                            ;;
                        "--permissions"|-p)
                            stat -c %A "$file_name"
                            ;;
                        "--owner"|-o)
                            stat -c %U "$file_name"
                            ;;
                        "--last-modified"|-m)
                            stat -c %y "$file_name"
                            ;;
                        *)
                            echo "Invalid option for file getinfo"
                            ;;
                    esac
                fi
                ;;
            *)
                echo "Invalid subcommand for file"
                ;;
        esac
        ;;
    *)
        echo "Invalid command. Use 'internsctl --help' for usage information."
        ;;
esac