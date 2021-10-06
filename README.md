These scripts create a simple Oracle Linux 8 vm that contains Podman, Buildah, Skopeo, runc, git and other useful tools for playing with containers.
You can use it as an alternative to Docker Desktop.

### Quickstart

1. Clone this repo:
```shell
git clone https://github.com/michalgutowski/container-tools.git
```

2. Provision the vm with Vagrant:
```shell
cd container-tools
vagrant up
```

3. Install podman on your MacOS
```shell
brew install podman
```

4. Configure podman remote client on your MacOS. Run the following command in **this** directory:
```shell
podman-remote system connection add vagrant --identity `pwd`/id_rsa ssh://vagrant@192.168.99.100/run/user/1000/podman/podman.sock
```
This will add a default connection for user vagrant

5. Test the connection
```shell
podman-remote info
```

6. Check if you can pull and run an nginx container
```shell
podman-remote run -it --rm -d -p 8080:80 --name web nginx
```
Navigate to http://192.168.99.100:8080 and you should see nginx welcome screen.

You can also add following lines to you /etc/hosts file on your MacOS to use hostname instead of IP address.
```console
192.168.99.100 podman
```

You can use ```vagrant suspend``` to simply suspend the vm when not needed and ```vagrant resume``` to start it up again.


### Adding custom container registries to the lookup list
To add any custom image registries simply login to the vm and modify the `registries.conf` file:
```shell
vagrant ssh podman
vi /etc/containers/registries.conf
```
