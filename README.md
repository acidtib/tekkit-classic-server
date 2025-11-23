# Tekkit Classic Server

A Dockerized Tekkit Classic (3.1.2) server.

## Usage

### Docker Compose (Recommended)

The easiest way to run the server locally is with Docker Compose. A `docker-compose.yml` file is included.

1.  (Optional) Edit `docker-compose.yml` to customize the `SERVER_OP` environment variable or volume paths.
2.  Run the server:
    ```bash
    docker-compose up -d
    ```
3.  View logs:
    ```bash
    docker-compose logs -f
    ```

### Docker Run

```bash
docker run -d \
    -p 25565:25565 \
    -e SERVER_OP=your_mc_account_name_here \
    --name=tekkit-classic-server \
    --restart=unless-stopped \
    tekkit-classic-server:latest
```

#### With Persistent Data

To persist world data and plugins, mount volumes as follows (adjust paths as needed):

```bash
docker run -d \
    -v ./data/world:/minecraft/world \
    -v ./data/world_nether:/minecraft/world_nether \
    -v ./data/world_the_end:/minecraft/world_the_end \
    -v ./data/plugins:/minecraft/plugins \
    -p 25565:25565 \
    -e SERVER_OP=your_mc_account_name_here \
    --name=tekkit-classic-server \
    --restart=unless-stopped \
    tekkit-classic-server:latest
```

## Configuration

-   `SERVER_OP`: Sets the initial server operator (OP).
-   `JAVA_ARGS`: JVM arguments (default: `-Xmx3G -Xms2G`).