# Angular containerization

This project is an example so as to create a container using a custom npm library registry.

We use yarn in de `Dockerfile.yarn` because the npm command has a clonfict when use windows and linux.

## Add a npm configuration file for use registry ans authorization

Create a personal token with package read permissions.

Create a file named `.npmrc` with:

```shell script
registry=https://pkgs.dev.azure.com/.../registry/
always-auth=true
//pkgs.dev.azure.com/CA-SistemasInformacion/_packaging/libControles/npm/registry/:username=VssSessionToken
; This is an unencrypted authentication token. Treat it like a password. DO NOT share this value with anyone, including Microsoft support.
//pkgs.dev.azure.com/CA-SistemasInformacion/_packaging/libControles/npm/registry/:_password=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
; The npm client won't use username and _password without an email set, but the service doesn't use the email value. The following is an arbitrarily made-up address.
//pkgs.dev.azure.com/CA-SistemasInformacion/_packaging/libControles/npm/registry/:email=not-used@example.com
```

Replace https://pkgs.dev.azure.com/.../registry/ with your custom npm library registry.

Replace xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx with your personal token created.