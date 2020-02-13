# hugo-caddy

Automatic update Hugo server powered by Caddy

## Config the server

1. Generate a new deployment key pair

    ```
    $ ssh-keygen -f ./.ssh/id_rsa
    ```

    This will generate you a new key pair (`./.ssh/id_rsa`, `./.ssh/id_rsa.pub`)

2. Move `./Caddyfile.example` to `./Caddyfile`

3. Edit `./Caddyfile`, replace the constants

    - `{YOUR_REPO_URL}`: Your Git repositories's SSH url

    - `{YOUR_HOOK_URL}`: The path you want the hook listener to bind, which can be access outside

    - `{YOUR_HOOK_SECRET}`: The secret, you can generate it as following

        ```
        openssl rand -base64 32
        ```

## Config your Git repo

1. Add `./.ssh/id_rsa.pub` to your repo's deploy keys, ensure it has **READ** access

2. Add `{YOUR_HOOK_URL}`'s full path that can be access outside to your Git webhook config, with secret `{YOUR_HOOK_SECRET}`

## Run

```
docker-compose up -d
```

## Notes

If you want pre-built images, replace following line in `docker-compose.yml`

```yml
build: .
```

with

```yml
image: forewing/hugo-caddy
```