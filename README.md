# internsctl - Custom Linux Command for Operations

## Overview

`internsctl` is a custom Linux command designed to facilitate various system operations. It provides functionalities related to CPU information, memory details, user management, and file operations.

## Features

-   **Manual Page:** Detailed manual page (`man internsctl`) for comprehensive documentation and usage guidelines.
-   **Help Option:** Use `internsctl --help` for quick reference and examples.
-   **Version Information:** Retrieve the version of the command with `internsctl --version`.
-   **CPU Operations:** Obtain CPU information using `internsctl cpu getinfo`.
-   **Memory Operations:** Retrieve memory information via `internsctl memory getinfo`.
-   **User Management:**
    -   Create a new user: `internsctl user create <username>`.
    -   List all users: `internsctl user list`.
    -   List users with sudo permissions: `internsctl user list --sudo-only`.
-   **File Operations:**
    -   Get information about a file: `internsctl file getinfo [options] <file-name>`.
        -   Options include `--size`, `--permissions`, `--owner`, and `--last-modified`.

## Installation

### Prerequisites

-   Bash shell
-   Superuser (root) privileges for installation

### Steps

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/pythoner-code/Xenon_Assignment1.git
    cd internsctl
    ```

1.  **Make the Script Executable:**

    ```bash
    chmod +x internsctl.sh
    ```

1.  **Move to a Directory in $PATH:**  
    Choose an appropriate directory in your $PATH. For example:

    ```bash
    sudo mv internsctl.sh /usr/local/bin/internsctl
    ```

1.  **Install the Man Page:**

    ```bash
    sudo gzip -c internsctl.1 > /usr/local/share/man/man1/internsctl.1.gz
    ```

    > If you encounter a `Permission Denied` error during the installation process, it may be due to insufficient privileges. In such cases, you can use the `su` (Super User) command to switch to the root user before executing the installation commands.

1.  **Test the Command:**  
    Open a new terminal and try the following commands:

    ```bash
    internsctl --help
    internsctl --version
    internsctl cpu getinfo
    ```

1.  **View Manual Page:**

    ```bash
    man internsctl
    ```
**ScreenShots:**

![image](https://github.com/pythoner-code/Xenon_Assignment1/assets/67531739/11471695-4fa7-419e-8867-80e4b1a89965)

![image](https://github.com/pythoner-code/Xenon_Assignment1/assets/67531739/dcb6ff72-3a8f-4c72-8023-5720a7fa81c2)
