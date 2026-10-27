# Add a second instance

A machine can run several frps or frpc. Here is how to add one:

1. On the **Dashboard**, click **New instance**.
2. Pick **frpc**, name it `second`, and (optional) copy the first frpc.
3. Create it, then start it from its card.

The new instance gets its own configuration file, its own log and free ports, so it never collides with the first one. On a machine with systemd, the panel creates the matching service for you; here, inside the container, it simply runs the program.

Open **Ports** and use the instance selector at the top right to switch between your two clients.

The **Firewall** page filters connections to the frps ports with nftables. It needs extra privileges (`NET_ADMIN`), which this sandbox does not give, so the page only explains what is missing.
