# vol2docker
Dockerfile(s) to build/deploy volatility2


## Building and running

To build the docker container:
`docker build -t local/vol2 .`

This should be added to your ~/.bashrc or ~/.zshrc
This ensures, that with the "vol2" command, the Docker 
Container starts running and loads in the data you specify

```sh
vol2() {
    docker run --rm -v "$(pwd):/data" local/vol2 "$@"
}
```

## Usage

These are basic examples of how to use this Volatility2 Setup:

```sh
# Identify the Profile (ImageInfo)
vol2 -f /data/dump.mem imageinfo

# List Processes (using the profile found above, e.g., Win7SP1x64)
vol2 -f /data/dump.mem --profile=Win7SP1x64 pslist

# Network Connections
vol2 -f /data/dump.mem --profile=Win7SP1x64 netscan
```
