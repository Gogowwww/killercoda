# Try FRP Manager

[FRP Manager](https://frp-manager.org) is a web panel for **frp**, the tool that exposes a service running at home (or on a private network) to the Internet through a public server.

Here you get the **real panel**, not a mock-up: the official Docker image is already running on this machine, with an frp server (**frps**) and an frp client (**frpc**) inside it, and a small web page that plays the part of "your service at home".

In about ten minutes you will:

1. open the panel and log in,
2. start frps, then frpc,
3. open a public port to the web page and reach it through frp,
4. create a second client with **New instance**.

The sign-in is already set up: user **demo**, password **frp-manager-demo**.

> The machine and everything on it disappear when the session ends. Nothing here touches your own servers.
