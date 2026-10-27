# Open a public port

A small web page is served on this machine on port `8000`: it stands for your service at home. Let's make it reachable from "the Internet" through frp.

1. In the panel, open **Ports** and click **Open a port**.
2. Name it **web**, choose **TCP**.
3. Local service: address `127.0.0.1`, port `8000`.
4. Public port: `20000`.
5. Click **Apply**, then save (the panel restarts frpc for you).

Now open **[the public port]({{TRAFFIC_HOST1_20000}})**: you see *Hello from my home service*, served through the frp tunnel.

Try the **TCP + UDP** type for another port: the panel writes the two tunnels and shows them as a single row.

Click **Check** when the page answers.
