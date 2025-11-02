# Server Bootstrap

A collection of scripts and configuration files for setting up a new server quickly.

Intended to run on an existing [Debian](https://www.debian.org/) environment.

## Dependencies

- [Debian](https://www.debian.org/) server (recommended). [Ubuntu](https://ubuntu.com/download/server) may work but is untested.  
- `curl` is required to download the script. Install with: `apt install curl`
        
## Installation

### 1. Download the script
`curl -O https://raw.githubusercontent.com/patricklarose/server-bootstrap/main/bootstrap.sh`

### 2. Give yourself Permissions
`chmod +x bootstrap.sh`

### 3. Run the script
`./bootstrap.sh`
