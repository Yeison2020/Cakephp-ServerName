# PHPCake Application

This guide provides steps to change the `ServerName` on a PHPCake application running `php:8.2-apache`

## Steps to Change ServerName

## 1. Configure `my-httpd.conf`

Configure your `my-httpd.conf` in the root directory with the domain of your choice. For example:

```apache
<VirtualHost *:80>
    ServerName dummy-host.example.com
</VirtualHost>
```

## 2. Start Application and Agent Containers

Start the application and agent with the following with:

```sh
docker-compose build && docker-compose up -d
```

## 3. Assign `dummy-host.example.com` to your Localhost

Edit your hosts file to assign `dummy-host.example.com` to your localhost:

```sh
sudo nano /etc/hosts
```

Add the following line to the file:

```plaintext
127.0.0.1 dummy-host.example.com
```

Save the configuration by pressing `CTRL + O`, then `ENTER`, and exit by pressing `CTRL + X`.

## 4. Navigate to Endpoints

Navigate to the following endpoints in your browser:

-   http://localhost:8081/hello-world
-   http://localhost:8081/hello-Order

Note: You will need to replace `localhost` with `dummy-host.example.com`. For example:

-   http://dummy-host.example.com/hello-world
-   http://dummy-host.example.com/hello-Order

## 5. Check Your Traces

Check your traces, especially the span tag `http.url`, to verify the configuration.

## Example

Here is a step-by-step example of the entire process:

1. **Configure `my-httpd.conf`:**

    Open `my-httpd.conf` and add the following configuration:

    ```apache
    <VirtualHost *:80>
        ServerName dummy-host.example.com
    </VirtualHost>
    ```

2. **Start Application and Agent Containers:**

    Run the following commands in your terminal:

    ```sh
    docker-compose build && docker-compose up -d
    ```

3. **Assign `dummy-host.example.com` to Localhost:**

    Open the hosts file for editing:

    ```sh
    sudo nano /etc/hosts
    ```

    Add this line to the file:

    ```plaintext
    127.0.0.1 dummy-host.example.com
    ```

    Save the changes by pressing `CTRL + O`, then `ENTER`, and exit by pressing `CTRL + X`.

4. **Navigate to Endpoints:**

    Open your web browser and go to:

    - http://dummy-host.example.com/hello-world
    - http://dummy-host.example.com/hello-Order

5. **Check Your Traces:**

    In your application monitoring tool, verify that the `http.url` span tag reflects the correct URLs.
