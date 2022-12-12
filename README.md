# handbook.koor.tech

This is the Koor Technologies, Inc. company and employee handbook built using [MkDocs](https://www.mkdocs.org/) and the beautiful [Material for MkDocs theme](https://squidfunk.github.io/mkdocs-material/).

## Contributing

You currently need to have Docker installed to be able to preview and build the site locally.

Please submit any code changes using a pull request.

### Local Preview

For the preview we are using a Docker image which contains the right mkdocs version, theme and plugins.

Assuming you have [Docker installed and running](https://docs.docker.com/get-docker/), you should be able to run the following command to get a local preview:

```console
make serve
```

### Building & Deploying

We use [Cloudflare Pages](https://pages.cloudflare.com/) for automatic building and deploying, and hosting of the handbook.
