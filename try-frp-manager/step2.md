# Start frps and frpc

On the **Dashboard**:

1. click **Start** on the **frps** card (the server, the public side),
2. then click **Start** on the **frpc** card (the client, the side "at home").

Both cards turn green (**Running**). The panel started the two programs itself inside the container: no systemd, no command line.

The client is already pointed at the server (same address, port and token). You can see that in **Settings, then Configuration** if you open the frpc file.

Open **Logs** to see the client connect: *login to server success*.

Click **Check** when both are running.
