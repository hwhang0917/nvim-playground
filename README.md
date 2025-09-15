# Neovim Playground

> Docker image to test and play with neovim configuration
>
> The default shell is set as `/bin/bash`

## Run clean slate

```bash
docker run -it --rm docker.io/heesangw/nvim-playground
```

then run `nvim` inside the container.

## Export your configuration

To save your neovim configuration after experimenting:

### 1. Run with volume mount

```bash
# Create output directory on host
mkdir -p ./nvim-configs

# Run container with volume mount
docker run -it -v $(pwd)/nvim-configs:/export docker.io/heesangw/nvim-playground
```

### 2. Configure neovim inside container

- Edit your neovim config in `~/.config/nvim/`
- Test and customize as needed
- Install plugins, adjust settings, etc.

### 3. Export configuration

When you're satisfied with your configuration, run:

```bash
export_nvim
```

This will create `nvim.tar.gz` in the `/export` directory (mounted to `./nvim-configs/` on your host).

### 4. Use exported configuration

Extract and use your configuration on other systems:

```bash
# Extract to your local neovim config
tar -xzf ./nvim-configs/nvim.tar.gz -C ~/.config/

# Or extract to examine the contents
mkdir -p ./temp-nvim
tar -xzf ./nvim-configs/nvim.tar.gz -C ./temp-nvim/
```

## Built-in aliases

The container includes convenient aliases:
- `vi` → `nvim`
- `vim` → `nvim`
- `ll` → `ls -la`
- `la` → `ls -A`
- `l` → `ls -CF`

## Alternative export method

If you prefer using `docker cp` instead of volume mounts:

```bash
# Run container with a name
docker run -it --name nvim-config docker.io/heesangw/nvim-playground

# Inside container: create archive manually
tar -czf /tmp/nvim.tar.gz -C ~/.config nvim

# From host (in another terminal): copy file out
docker cp nvim-config:/tmp/nvim.tar.gz ./nvim.tar.gz

# Clean up
docker rm nvim-config
```
