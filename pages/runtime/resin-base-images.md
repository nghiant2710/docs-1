# Resin Base Images Wiki

This page contains all the information about the images maintained on the Resin.io docker hub registry.

## <a name="image-tree"></a>Resin Image Trees

This section describes the Resin image trees (hierarchy of images). These image trees provide an overview of how all the resin base images fit together for each device type supported by Resin.

Repository for all images: refer [here][base-repository]. Subscribe to changes [here][base-images-changelog].

### Introduction

For each architecture supported by Resin, there are bare-bones base images which is a minimal variant of Linux distributions (currently we support Debian, Alpine Linux and Fedora). On top of the architecture-based images, we build specific base images for each supported device. The below table will describe full description with details about pre-installed packages on each base images.

| Image | Description | Installed Packages | Available Tag |
|:-----------|:------------|:------------|:------------|
| resin/`arch`-debian | The base OS image based on Debian for a specific architecture. Systend init system is installed in this base image, see our [tips](#tips) section on how to enable systemd in your image. | minbase, sudo, systemd | latest, jessie, wheezy, sid |
| resin/`arch`-alpine | The base OS image based on Alpine Linux for a specific architecture. OpenRC init system is installed in this base image, see our [tips](#tips) section on how to enable OpenRC in your image. | minbase, bash, udev, dbus, tar, ca-certificates, openrc | latest, 3.4, edge, 3.3, 3.2 |
| resin/`arch`-fedora | The base OS image based on Fedora for a specific architecture. Systemd init system is installed in this base image, see our [tips](#tips) section on how to enable systemd in your image. | minbase, systemd | latest, 24, 23 |
| resin/`device-name`-debian | The bare bones Debian OS image for a supported device. | usbutils, net-tools, iputils-ping, module-init-tools, less, nano, i2c-tools, ifupdown | latest, jessie, wheezy |
| resin/`device-name`-buildpack-deps | The Debian buildpack-deps image for a supported device. Details about buildpack-deps can be found [here](#buildpack-deps) | Refer [here](#buildpack-deps) | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/`device-name`-node | The Debian Node.js buildpack image for Node.js apps for a supported device. Details about the Node.js image can be found [here](#node) | Refer [here](#node) | |
| resin/`device-name`-python | The Debian Python buildpack image for Python apps for a supported device | Refer [here](#python) | |
| resin/`device-name`-golang | The Debian Go buildpack image for Go apps for a supported device. Details about the Go image can be found [here](#golang) | Refer [here](#golang) | |
| resin/`device-name`-openjdk | The Debian OpenJDK image is an open-source implementation of the Java Platform, Standard Edition for a supported device. Details about the OpenJDK image can be found [here](#OpenJDK) | Refer [here](#OpenJDK) | |
| resin/`device-name`-alpine | The bare-bones Alpine Linux OS image for a supported device. | less, nano, net-tools, ifupdown, usbutils, gnupg | latest, 3.4, 3.3, 3.2, edge |
| resin/`device-name`-alpine-buildpack-deps | The buildpack-deps image based on Alpine Linux for a supported device. Details about buildpack-deps can be found [here](#buildpack-deps) | Refer [here](#buildpack-deps) | latest, 3.4, edge, 3.4-scm, edge-scm, 3.4-curl, edge-curl |
| resin/`device-name`-alpine-node | The Node.js buildpack image based on Alpine Linux for Node.js apps for a supported device. Details about the Node.js image can be found [here](#node) | Refer [here](#node) | |
| resin/`device-name`-alpine-python | The Python buildpack image based on Alpine Linux for Python apps for a supported device | Refer [here](#python) | |
| resin/`device-name`-alpine-golang | The Go buildpack image based on Alpine Linux for Go apps for a supported device. Details about the Go image can be found [here](#golang) | Refer [here](#golang) | |
| resin/`device-name`-alpine-openjdk | The Alpine Linux OpenJDK image is an open-source implementation of the Java Platform, Standard Edition for a supported device. Details about the OpenJDK image can be found [here](#OpenJDK) | Refer [here](#OpenJDK) | |
| resin/`device-name`-fedora | The bare-bones Fedora OS image for a supported device. | less, nano, net-tools, ifupdown, usbutils, gnupg | latest, 24 |
| resin/`device-name`-fedora-buildpack-deps | The buildpack-deps image based on Fedora for a supported device. Details about buildpack-deps can be found [here](#buildpack-deps) | Refer [here](#buildpack-deps) | latest, 24, 24-scm, 24-curl |
| resin/`device-name`-fedora-node | The Node.js buildpack image based on Fedora for Node.js apps for a supported device. Details about the Node.js image can be found [here](#node) | Refer [here](#node) | |
| resin/`device-name`-fedora-python | The Python buildpack image based on Fedora for Python apps for a supported device | Refer [here](#python) | |
| resin/`device-name`-fedora-golang | The Go buildpack image based on Fedora for Go apps for a supported device. Details about the Go image can be found [here](#golang) | Refer [here](#golang) | |
| resin/`device-name`-fedora-openjdk | The Fedora OpenJDK image is an open-source implementation of the Java Platform, Standard Edition for a supported device. Details about the OpenJDK image can be found [here](#OpenJDK) | Refer [here](#OpenJDK) | |

##### Notice:

* Currently, we support 6 architectures: amd64, i386, aarch64, armv7hf, armv6hf and armel; however, not all supported Linux distros support these architectures, only Debian does. We don't have Resin Alpine Linux base images for aarch64 and armel and only armv7hf Fedora base images supported at the moment.
* Depends on available packages on each Linux distribution, specific packages for each device are pre-installed in `device-distro` combination base images e.g., `libraspberrypi-bin` preinstalled in Debian based images for Raspberry Pi family or `http://repos.rcn-ee.net/debian/` - a Debian package repository for only Beaglebone family will be added into base images for them. 

### <a name="base-images"></a>Base Images:

These are base images for different architectures:

| Image | Arch | Repository | Available Tag|
|:-----------|:------------|:------------|:------------|:------------|
| `resin/rpi-raspbian` (alias `resin/raspberrypi-debian`) | armv6hf | [dockerhub][rpi-dockerhub-link], [github][rpi-github-link] | latest, jessie, wheezy |
| `resin/armv7hf-debian` | armv7hf | [dockerhub][armv7hf-dockerhub-link], [github][armv7hf-github-link] | latest, jessie, wheezy, sid |
| `resin/i386-debian` | i386 | [dockerhub][i386-dockerhub-link], [github][i386-github-link] | latest, jessie, wheezy |
| `resin/amd64-debian` | amd64 | [dockerhub][amd64-dockerhub-link], [github][amd64-github-link] | latest, jessie, wheezy |
| `resin/armel-debian` | armel | [dockerhub][armel-dockerhub-link], [github][armel-github-link] | latest, jessie, wheezy |
| `resin/aarch64-debian` | aarch64 | [dockerhub][aarch64-dockerhub-link], [github][aarch64-github-link] | latest, jessie |
| `resin/armhf-alpine` | armhf | [dockerhub][armhf-alpine-dockerhub-link], [github][armhf-alpine-github-link] | latest, 3.4, 3.3, 3.2, edge |
| `resin/amd64-alpine` | amd64 | [dockerhub][amd64-alpine-dockerhub-link], [github][amd64-alpine-github-link] | latest, 3.4,3.3, 3.2, edge |
| `resin/i386-alpine` | i386 | [dockerhub][i386-alpine-dockerhub-link], [github][i386-alpine-github-link] | latest, 3.4, 3.3, 3.2, edge |
| `resin/armv7hf-fedora` | armv7hf | [dockerhub][armv7hf-fedora-dockerhub-link], [github][armv7hf-fedora-github-link] | latest, 24, 23 |

![Hierarchy Diagram](/img/hierarchy-diagram.jpg)

__Note:__ In the tree diagram, from the bottom to the top, the lower level image is used as the base docker image to build the upper level one.

### ARMv6hf:

![ARMv6 Tree Diagram](/img/armv6-devices.jpg)



##### Raspberry Pi v1 & ZERO

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/raspberrypi-debian | [dockerhub][armv6hf-raspberrypi-dockerhub-link], [github][armv6hf-raspberrypi-github-link] | latest, jessie, wheezy |
| resin/raspberrypi-buildpack-deps | [dockerhub][armv6hf-raspberrypi-buildpack-deps-dockerhub-link], [github][armv6hf-raspberrypi-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/raspberrypi-node | [dockerhub][armv6hf-raspberrypi-node-dockerhub-link], [github][armv6hf-raspberrypi-node-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-node-dockerhub-tag-link] |
| resin/raspberrypi-python | [dockerhub][armv6hf-raspberrypi-python-dockerhub-link], [github][armv6hf-raspberrypi-python-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-python-dockerhub-tag-link] |
| resin/raspberrypi-golang | [dockerhub][armv6hf-raspberrypi-golang-dockerhub-link], [github][armv6hf-raspberrypi-golang-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-golang-dockerhub-tag-link] |
| resin/raspberrypi-openjdk | [dockerhub][armv6hf-raspberrypi-openjdk-dockerhub-link], [github][armv6hf-raspberrypi-openjdk-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-openjdk-dockerhub-tag-link] |
| resin/raspberrypi-alpine | [dockerhub][armv6hf-raspberrypi-alpine-dockerhub-link], [github][armv6hf-raspberrypi-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/raspberrypi-alpine-buildpack-deps | [dockerhub][armv6hf-raspberrypi-alpine-buildpack-deps-dockerhub-link], [github][armv6hf-raspberrypi-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/raspberrypi-alpine-node | [dockerhub][armv6hf-raspberrypi-alpine-node-dockerhub-link], [github][armv6hf-raspberrypi-alpine-node-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-alpine-node-dockerhub-tag-link] |
| resin/raspberrypi-alpine-python | [dockerhub][armv6hf-raspberrypi-alpine-python-dockerhub-link], [github][armv6hf-raspberrypi-alpine-python-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-alpine-python-dockerhub-tag-link] |
| resin/raspberrypi-alpine-golang | [dockerhub][armv6hf-raspberrypi-alpine-golang-dockerhub-link], [github][armv6hf-raspberrypi-alpine-golang-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-alpine-golang-dockerhub-tag-link] |
| resin/raspberrypi-alpine-openjdk | [dockerhub][armv6hf-raspberrypi-alpine-openjdk-dockerhub-link], [github][armv6hf-raspberrypi-alpine-openjdk-github-link] | For available image tags, refer [here][armv6hf-raspberrypi-alpine-openjdk-dockerhub-tag-link] |

### ARMv7hf:

![ARMv7 Tree Diagram](/img/armv7-devices.jpg)



##### Raspberry Pi 2

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/raspberrypi2-debian | [dockerhub][armv7hf-raspberrypi2-dockerhub-link], [github][armv7hf-raspberrypi2-github-link] | latest, jessie, wheezy |
| resin/raspberrypi2-buildpack-deps | [dockerhub][armv7hf-raspberrypi2-buildpack-deps-dockerhub-link], [github][armv7hf-raspberrypi2-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/raspberrypi2-node | [dockerhub][armv7hf-raspberrypi2-node-dockerhub-link], [github][armv7hf-raspberrypi2-node-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-node-dockerhub-tag-link] |
| resin/raspberrypi2-python | [dockerhub][armv7hf-raspberrypi2-python-dockerhub-link], [github][armv7hf-raspberrypi2-python-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-python-dockerhub-tag-link] |
| resin/raspberrypi2-golang | [dockerhub][armv7hf-raspberrypi2-golang-dockerhub-link], [github][armv7hf-raspberrypi2-golang-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-golang-dockerhub-tag-link] |
| resin/raspberrypi2-openjdk | [dockerhub][armv7hf-raspberrypi2-openjdk-dockerhub-link], [github][armv7hf-raspberrypi2-openjdk-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-openjdk-dockerhub-tag-link] |
| resin/raspberrypi2-alpine | [dockerhub][armv7hf-raspberrypi2-alpine-dockerhub-link], [github][armv7hf-raspberrypi2-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/raspberrypi2-alpine-buildpack-deps | [dockerhub][armv7hf-raspberrypi2-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-raspberrypi2-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/raspberrypi2-alpine-node | [dockerhub][armv7hf-raspberrypi2-alpine-node-dockerhub-link], [github][armv7hf-raspberrypi2-alpine-node-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-alpine-node-dockerhub-tag-link] |
| resin/raspberrypi2-alpine-python | [dockerhub][armv7hf-raspberrypi2-alpine-python-dockerhub-link], [github][armv7hf-raspberrypi2-alpine-python-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-alpine-python-dockerhub-tag-link] |
| resin/raspberrypi2-alpine-golang | [dockerhub][armv7hf-raspberrypi2-alpine-golang-dockerhub-link], [github][armv7hf-raspberrypi2-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-alpine-golang-dockerhub-tag-link] |
| resin/raspberrypi2-alpine-openjdk | [dockerhub][armv7hf-raspberrypi2-alpine-openjdk-dockerhub-link], [github][armv7hf-raspberrypi2-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-alpine-openjdk-dockerhub-tag-link] |
| resin/raspberrypi2-fedora | [dockerhub][armv7hf-raspberrypi2-fedora-node-dockerhub-link], [github][armv7hf-raspberrypi2-fedora-node-github-link] | latest, 24 |
| resin/raspberrypi2-fedora-buildpack-deps | [dockerhub][armv7hf-raspberrypi2-fedora-node-dockerhub-link], [github][armv7hf-raspberrypi2-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/raspberrypi2-fedora-node | [dockerhub][armv7hf-raspberrypi2-fedora-node-dockerhub-link], [github][armv7hf-raspberrypi2-fedora-node-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-fedora-node-dockerhub-tag-link] |
| resin/raspberrypi2-fedora-python | [dockerhub][armv7hf-raspberrypi2-fedora-python-dockerhub-link], [github][armv7hf-raspberrypi2-fedora-python-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-fedora-python-dockerhub-tag-link] |
| resin/raspberrypi2-fedora-golang | [dockerhub][armv7hf-raspberrypi2-fedora-golang-dockerhub-link], [github][armv7hf-raspberrypi2-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-fedora-golang-dockerhub-tag-link] |
| resin/raspberrypi2-fedora-openjdk | [dockerhub][armv7hf-raspberrypi2-fedora-openjdk-dockerhub-link], [github][armv7hf-raspberrypi2-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-raspberrypi2-fedora-openjdk-dockerhub-tag-link] |

##### Raspberry Pi 3

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/raspberrypi3-debian | [dockerhub][armv7hf-raspberrypi3-dockerhub-link], [github][armv7hf-raspberrypi3-github-link] | latest, jessie, wheezy |
| resin/raspberrypi3-buildpack-deps | [dockerhub][armv7hf-raspberrypi3-buildpack-deps-dockerhub-link], [github][armv7hf-raspberrypi3-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/raspberrypi3-node | [dockerhub][armv7hf-raspberrypi3-node-dockerhub-link], [github][armv7hf-raspberrypi3-node-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-node-dockerhub-tag-link] |
| resin/raspberrypi3-python | [dockerhub][armv7hf-raspberrypi3-python-dockerhub-link], [github][armv7hf-raspberrypi3-python-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-python-dockerhub-tag-link] |
| resin/raspberrypi3-golang | [dockerhub][armv7hf-raspberrypi3-golang-dockerhub-link], [github][armv7hf-raspberrypi3-golang-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-golang-dockerhub-tag-link] |
| resin/raspberrypi3-openjdk | [dockerhub][armv7hf-raspberrypi3-openjdk-dockerhub-link], [github][armv7hf-raspberrypi3-openjdk-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-openjdk-dockerhub-tag-link] |
| resin/raspberrypi3-alpine | [dockerhub][armv7hf-raspberrypi3-alpine-dockerhub-link], [github][armv7hf-raspberrypi3-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/raspberrypi3-alpine-buildpack-deps | [dockerhub][armv7hf-raspberrypi3-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-raspberrypi3-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/raspberrypi3-alpine-node | [dockerhub][armv7hf-raspberrypi3-alpine-node-dockerhub-link], [github][armv7hf-raspberrypi3-alpine-node-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-alpine-node-dockerhub-tag-link] |
| resin/raspberrypi3-alpine-python | [dockerhub][armv7hf-raspberrypi3-alpine-python-dockerhub-link], [github][armv7hf-raspberrypi3-alpine-python-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-alpine-python-dockerhub-tag-link] |
| resin/raspberrypi3-alpine-golang | [dockerhub][armv7hf-raspberrypi3-alpine-golang-dockerhub-link], [github][armv7hf-raspberrypi3-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-alpine-golang-dockerhub-tag-link] |
| resin/raspberrypi3-alpine-openjdk | [dockerhub][armv7hf-raspberrypi3-alpine-openjdk-dockerhub-link], [github][armv7hf-raspberrypi3-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-alpine-openjdk-dockerhub-tag-link] |
| resin/raspberrypi3-fedora | [dockerhub][armv7hf-raspberrypi3-fedora-node-dockerhub-link], [github][armv7hf-raspberrypi3-fedora-node-github-link] | latest, 24 |
| resin/raspberrypi3-fedora-buildpack-deps | [dockerhub][armv7hf-raspberrypi3-fedora-node-dockerhub-link], [github][armv7hf-raspberrypi3-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/raspberrypi3-fedora-node | [dockerhub][armv7hf-raspberrypi3-fedora-node-dockerhub-link], [github][armv7hf-raspberrypi3-fedora-node-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-fedora-node-dockerhub-tag-link] |
| resin/raspberrypi3-fedora-python | [dockerhub][armv7hf-raspberrypi3-fedora-python-dockerhub-link], [github][armv7hf-raspberrypi3-fedora-python-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-fedora-python-dockerhub-tag-link] |
| resin/raspberrypi3-fedora-golang | [dockerhub][armv7hf-raspberrypi3-fedora-golang-dockerhub-link], [github][armv7hf-raspberrypi3-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-fedora-golang-dockerhub-tag-link] |
| resin/raspberrypi3-fedora-openjdk | [dockerhub][armv7hf-raspberrypi3-fedora-openjdk-dockerhub-link], [github][armv7hf-raspberrypi3-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-raspberrypi3-fedora-openjdk-dockerhub-tag-link] |

##### Beaglebone Black

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/beaglebone-debian | [dockerhub][armv7hf-beaglebone-dockerhub-link], [github][armv7hf-beaglebone-github-link] | latest, jessie, wheezy |
| resin/beaglebone-buildpack-deps | [dockerhub][armv7hf-beaglebone-buildpack-deps-dockerhub-link], [github][armv7hf-beaglebone-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/beaglebone-node | [dockerhub][armv7hf-beaglebone-node-dockerhub-link], [github][armv7hf-beaglebone-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-node-dockerhub-tag-link] |
| resin/beaglebone-python | [dockerhub][armv7hf-beaglebone-python-dockerhub-link], [github][armv7hf-beaglebone-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-python-dockerhub-tag-link] |
| resin/beaglebone-golang | [dockerhub][armv7hf-beaglebone-golang-dockerhub-link], [github][armv7hf-beaglebone-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-golang-dockerhub-tag-link] |
| resin/beaglebone-openjdk | [dockerhub][armv7hf-beaglebone-openjdk-dockerhub-link], [github][armv7hf-beaglebone-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-openjdk-dockerhub-tag-link] |
| resin/beaglebone-alpine | [dockerhub][armv7hf-beaglebone-alpine-dockerhub-link], [github][armv7hf-beaglebone-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/beaglebone-alpine-buildpack-deps | [dockerhub][armv7hf-beaglebone-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-beaglebone-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/beaglebone-alpine-node | [dockerhub][armv7hf-beaglebone-alpine-node-dockerhub-link], [github][armv7hf-beaglebone-alpine-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-alpine-node-dockerhub-tag-link] |
| resin/beaglebone-alpine-python | [dockerhub][armv7hf-beaglebone-alpine-python-dockerhub-link], [github][armv7hf-beaglebone-alpine-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-alpine-python-dockerhub-tag-link] |
| resin/beaglebone-alpine-golang | [dockerhub][armv7hf-beaglebone-alpine-golang-dockerhub-link], [github][armv7hf-beaglebone-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-alpine-golang-dockerhub-tag-link] |
| resin/beaglebone-alpine-openjdk | [dockerhub][armv7hf-beaglebone-alpine-openjdk-dockerhub-link], [github][armv7hf-beaglebone-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-alpine-openjdk-dockerhub-tag-link] |
| resin/beaglebone-fedora | [dockerhub][armv7hf-beaglebone-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-fedora-node-github-link] | latest, 24 |
| resin/beaglebone-fedora-buildpack-deps | [dockerhub][armv7hf-beaglebone-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/beaglebone-fedora-node | [dockerhub][armv7hf-beaglebone-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-fedora-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-fedora-node-dockerhub-tag-link] |
| resin/beaglebone-fedora-python | [dockerhub][armv7hf-beaglebone-fedora-python-dockerhub-link], [github][armv7hf-beaglebone-fedora-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-fedora-python-dockerhub-tag-link] |
| resin/beaglebone-fedora-golang | [dockerhub][armv7hf-beaglebone-fedora-golang-dockerhub-link], [github][armv7hf-beaglebone-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-fedora-golang-dockerhub-tag-link] |
| resin/beaglebone-fedora-openjdk | [dockerhub][armv7hf-beaglebone-fedora-openjdk-dockerhub-link], [github][armv7hf-beaglebone-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-fedora-openjdk-dockerhub-tag-link] |

##### Beaglebone Green

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/beaglebone-green-debian | [dockerhub][armv7hf-beaglebone-green-dockerhub-link], [github][armv7hf-beaglebone-green-github-link] | latest, jessie, wheezy |
| resin/beaglebone-green-buildpack-deps | [dockerhub][armv7hf-beaglebone-green-buildpack-deps-dockerhub-link], [github][armv7hf-beaglebone-green-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/beaglebone-green-node | [dockerhub][armv7hf-beaglebone-green-node-dockerhub-link], [github][armv7hf-beaglebone-green-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-node-dockerhub-tag-link] |
| resin/beaglebone-green-python | [dockerhub][armv7hf-beaglebone-green-python-dockerhub-link], [github][armv7hf-beaglebone-green-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-python-dockerhub-tag-link] |
| resin/beaglebone-green-golang | [dockerhub][armv7hf-beaglebone-green-golang-dockerhub-link], [github][armv7hf-beaglebone-green-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-golang-dockerhub-tag-link] |
| resin/beaglebone-green-openjdk | [dockerhub][armv7hf-beaglebone-green-openjdk-dockerhub-link], [github][armv7hf-beaglebone-green-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-openjdk-dockerhub-tag-link] |
| resin/beaglebone-green-alpine | [dockerhub][armv7hf-beaglebone-green-alpine-dockerhub-link], [github][armv7hf-beaglebone-green-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/beaglebone-green-alpine-buildpack-deps | [dockerhub][armv7hf-beaglebone-green-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-beaglebone-green-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/beaglebone-green-alpine-node | [dockerhub][armv7hf-beaglebone-green-alpine-node-dockerhub-link], [github][armv7hf-beaglebone-green-alpine-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-alpine-node-dockerhub-tag-link] |
| resin/beaglebone-green-alpine-python | [dockerhub][armv7hf-beaglebone-green-alpine-python-dockerhub-link], [github][armv7hf-beaglebone-green-alpine-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-alpine-python-dockerhub-tag-link] |
| resin/beaglebone-green-alpine-golang | [dockerhub][armv7hf-beaglebone-green-alpine-golang-dockerhub-link], [github][armv7hf-beaglebone-green-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-alpine-golang-dockerhub-tag-link] |
| resin/beaglebone-green-alpine-openjdk | [dockerhub][armv7hf-beaglebone-green-alpine-openjdk-dockerhub-link], [github][armv7hf-beaglebone-green-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-alpine-openjdk-dockerhub-tag-link] |
| resin/beaglebone-green-fedora | [dockerhub][armv7hf-beaglebone-green-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-green-fedora-node-github-link] | latest, 24 |
| resin/beaglebone-green-fedora-buildpack-deps | [dockerhub][armv7hf-beaglebone-green-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-green-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/beaglebone-green-fedora-node | [dockerhub][armv7hf-beaglebone-green-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-green-fedora-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-fedora-node-dockerhub-tag-link] |
| resin/beaglebone-green-fedora-python | [dockerhub][armv7hf-beaglebone-green-fedora-python-dockerhub-link], [github][armv7hf-beaglebone-green-fedora-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-fedora-python-dockerhub-tag-link] |
| resin/beaglebone-green-fedora-golang | [dockerhub][armv7hf-beaglebone-green-fedora-golang-dockerhub-link], [github][armv7hf-beaglebone-green-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-fedora-golang-dockerhub-tag-link] |
| resin/beaglebone-green-fedora-openjdk | [dockerhub][armv7hf-beaglebone-green-fedora-openjdk-dockerhub-link], [github][armv7hf-beaglebone-green-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-fedora-openjdk-dockerhub-tag-link] |

##### Beaglebone Green Wireless

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/beaglebone-green-wifi-debian | [dockerhub][armv7hf-beaglebone-green-wifi-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-github-link] | latest, jessie, wheezy |
| resin/beaglebone-green-wifi-buildpack-deps | [dockerhub][armv7hf-beaglebone-green-wifi-buildpack-deps-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/beaglebone-green-wifi-node | [dockerhub][armv7hf-beaglebone-green-wifi-node-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-node-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-python | [dockerhub][armv7hf-beaglebone-green-wifi-python-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-python-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-golang | [dockerhub][armv7hf-beaglebone-green-wifi-golang-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-golang-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-openjdk | [dockerhub][armv7hf-beaglebone-green-wifi-openjdk-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-openjdk-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-alpine | [dockerhub][armv7hf-beaglebone-green-wifi-alpine-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/beaglebone-green-wifi-alpine-buildpack-deps | [dockerhub][armv7hf-beaglebone-green-wifi-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/beaglebone-green-wifi-alpine-node | [dockerhub][armv7hf-beaglebone-green-wifi-alpine-node-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-alpine-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-alpine-node-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-alpine-python | [dockerhub][armv7hf-beaglebone-green-wifi-alpine-python-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-alpine-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-alpine-python-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-alpine-golang | [dockerhub][armv7hf-beaglebone-green-wifi-alpine-golang-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-alpine-golang-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-alpine-openjdk | [dockerhub][armv7hf-beaglebone-green-wifi-alpine-openjdk-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-alpine-openjdk-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-fedora | [dockerhub][armv7hf-beaglebone-green-wifi-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-fedora-node-github-link] | latest, 24 |
| resin/beaglebone-green-wifi-fedora-buildpack-deps | [dockerhub][armv7hf-beaglebone-green-wifi-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/beaglebone-green-wifi-fedora-node | [dockerhub][armv7hf-beaglebone-green-wifi-fedora-node-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-fedora-node-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-fedora-node-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-fedora-python | [dockerhub][armv7hf-beaglebone-green-wifi-fedora-python-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-fedora-python-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-fedora-python-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-fedora-golang | [dockerhub][armv7hf-beaglebone-green-wifi-fedora-golang-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-fedora-golang-dockerhub-tag-link] |
| resin/beaglebone-green-wifi-fedora-openjdk | [dockerhub][armv7hf-beaglebone-green-wifi-fedora-openjdk-dockerhub-link], [github][armv7hf-beaglebone-green-wifi-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-beaglebone-green-wifi-fedora-openjdk-dockerhub-tag-link] |

##### VIA VAB 820-quad

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/vab820-quad-debian | [dockerhub][armv7hf-vab820-quad-dockerhub-link], [github][armv7hf-vab820-quad-github-link] | latest, jessie, wheezy |
| resin/vab820-quad-buildpack-deps | [dockerhub][armv7hf-vab820-quad-buildpack-deps-dockerhub-link], [github][armv7hf-vab820-quad-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/vab820-quad-node | [dockerhub][armv7hf-vab820-quad-node-dockerhub-link], [github][armv7hf-vab820-quad-node-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-node-dockerhub-tag-link] |
| resin/vab820-quad-python | [dockerhub][armv7hf-vab820-quad-python-dockerhub-link], [github][armv7hf-vab820-quad-python-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-python-dockerhub-tag-link] |
| resin/vab820-quad-golang | [dockerhub][armv7hf-vab820-quad-golang-dockerhub-link], [github][armv7hf-vab820-quad-golang-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-golang-dockerhub-tag-link] |
| resin/vab820-quad-openjdk | [dockerhub][armv7hf-vab820-quad-openjdk-dockerhub-link], [github][armv7hf-vab820-quad-openjdk-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-openjdk-dockerhub-tag-link] |
| resin/vab820-quad-alpine | [dockerhub][armv7hf-vab820-quad-alpine-dockerhub-link], [github][armv7hf-vab820-quad-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/vab820-quad-alpine-buildpack-deps | [dockerhub][armv7hf-vab820-quad-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-vab820-quad-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/vab820-quad-alpine-node | [dockerhub][armv7hf-vab820-quad-alpine-node-dockerhub-link], [github][armv7hf-vab820-quad-alpine-node-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-alpine-node-dockerhub-tag-link] |
| resin/vab820-quad-alpine-python | [dockerhub][armv7hf-vab820-quad-alpine-python-dockerhub-link], [github][armv7hf-vab820-quad-alpine-python-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-alpine-python-dockerhub-tag-link] |
| resin/vab820-quad-alpine-golang | [dockerhub][armv7hf-vab820-quad-alpine-golang-dockerhub-link], [github][armv7hf-vab820-quad-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-alpine-golang-dockerhub-tag-link] |
| resin/vab820-quad-alpine-openjdk | [dockerhub][armv7hf-vab820-quad-alpine-openjdk-dockerhub-link], [github][armv7hf-vab820-quad-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-alpine-openjdk-dockerhub-tag-link] |
| resin/vab820-quad-fedora | [dockerhub][armv7hf-vab820-quad-fedora-node-dockerhub-link], [github][armv7hf-vab820-quad-fedora-node-github-link] | latest, 24 |
| resin/vab820-quad-fedora-buildpack-deps | [dockerhub][armv7hf-vab820-quad-fedora-node-dockerhub-link], [github][armv7hf-vab820-quad-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/vab820-quad-fedora-node | [dockerhub][armv7hf-vab820-quad-fedora-node-dockerhub-link], [github][armv7hf-vab820-quad-fedora-node-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-fedora-node-dockerhub-tag-link] |
| resin/vab820-quad-fedora-python | [dockerhub][armv7hf-vab820-quad-fedora-python-dockerhub-link], [github][armv7hf-vab820-quad-fedora-python-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-fedora-python-dockerhub-tag-link] |
| resin/vab820-quad-fedora-golang | [dockerhub][armv7hf-vab820-quad-fedora-golang-dockerhub-link], [github][armv7hf-vab820-quad-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-fedora-golang-dockerhub-tag-link] |
| resin/vab820-quad-fedora-openjdk | [dockerhub][armv7hf-vab820-quad-fedora-openjdk-dockerhub-link], [github][armv7hf-vab820-quad-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-vab820-quad-fedora-openjdk-dockerhub-tag-link] |

##### Zynq ZC702

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/zc702-zynq7-debian | [dockerhub][armv7hf-zc702-zynq7-dockerhub-link], [github][armv7hf-zc702-zynq7-github-link] | latest, jessie, wheezy |
| resin/zc702-zynq7-buildpack-deps | [dockerhub][armv7hf-zc702-zynq7-buildpack-deps-dockerhub-link], [github][armv7hf-zc702-zynq7-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/zc702-zynq7-node | [dockerhub][armv7hf-zc702-zynq7-node-dockerhub-link], [github][armv7hf-zc702-zynq7-node-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-node-dockerhub-tag-link] |
| resin/zc702-zynq7-python | [dockerhub][armv7hf-zc702-zynq7-python-dockerhub-link], [github][armv7hf-zc702-zynq7-python-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-python-dockerhub-tag-link] |
| resin/zc702-zynq7-golang | [dockerhub][armv7hf-zc702-zynq7-golang-dockerhub-link], [github][armv7hf-zc702-zynq7-golang-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-golang-dockerhub-tag-link] |
| resin/zc702-zynq7-openjdk | [dockerhub][armv7hf-zc702-zynq7-openjdk-dockerhub-link], [github][armv7hf-zc702-zynq7-openjdk-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-openjdk-dockerhub-tag-link] |
| resin/zc702-zynq7-alpine | [dockerhub][armv7hf-zc702-zynq7-alpine-dockerhub-link], [github][armv7hf-zc702-zynq7-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/zc702-zynq7-alpine-buildpack-deps | [dockerhub][armv7hf-zc702-zynq7-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-zc702-zynq7-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/zc702-zynq7-alpine-node | [dockerhub][armv7hf-zc702-zynq7-alpine-node-dockerhub-link], [github][armv7hf-zc702-zynq7-alpine-node-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-alpine-node-dockerhub-tag-link] |
| resin/zc702-zynq7-alpine-python | [dockerhub][armv7hf-zc702-zynq7-alpine-python-dockerhub-link], [github][armv7hf-zc702-zynq7-alpine-python-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-alpine-python-dockerhub-tag-link] |
| resin/zc702-zynq7-alpine-golang | [dockerhub][armv7hf-zc702-zynq7-alpine-golang-dockerhub-link], [github][armv7hf-zc702-zynq7-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-alpine-golang-dockerhub-tag-link] |
| resin/zc702-zynq7-alpine-openjdk | [dockerhub][armv7hf-zc702-zynq7-alpine-openjdk-dockerhub-link], [github][armv7hf-zc702-zynq7-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-alpine-openjdk-dockerhub-tag-link] |
| resin/zc702-zynq7-fedora | [dockerhub][armv7hf-zc702-zynq7-fedora-node-dockerhub-link], [github][armv7hf-zc702-zynq7-fedora-node-github-link] | latest, 24 |
| resin/zc702-zynq7-fedora-buildpack-deps | [dockerhub][armv7hf-zc702-zynq7-fedora-node-dockerhub-link], [github][armv7hf-zc702-zynq7-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/zc702-zynq7-fedora-node | [dockerhub][armv7hf-zc702-zynq7-fedora-node-dockerhub-link], [github][armv7hf-zc702-zynq7-fedora-node-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-fedora-node-dockerhub-tag-link] |
| resin/zc702-zynq7-fedora-python | [dockerhub][armv7hf-zc702-zynq7-fedora-python-dockerhub-link], [github][armv7hf-zc702-zynq7-fedora-python-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-fedora-python-dockerhub-tag-link] |
| resin/zc702-zynq7-fedora-golang | [dockerhub][armv7hf-zc702-zynq7-fedora-golang-dockerhub-link], [github][armv7hf-zc702-zynq7-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-fedora-golang-dockerhub-tag-link] |
| resin/zc702-zynq7-fedora-openjdk | [dockerhub][armv7hf-zc702-zynq7-fedora-openjdk-dockerhub-link], [github][armv7hf-zc702-zynq7-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-zc702-zynq7-fedora-openjdk-dockerhub-tag-link] |

##### ODROID-C1+

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/odroid-c1-debian | [dockerhub][armv7hf-odroid-c1-dockerhub-link], [github][armv7hf-odroid-c1-github-link] | latest, jessie, wheezy |
| resin/odroid-c1-buildpack-deps | [dockerhub][armv7hf-odroid-c1-buildpack-deps-dockerhub-link], [github][armv7hf-odroid-c1-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/odroid-c1-node | [dockerhub][armv7hf-odroid-c1-node-dockerhub-link], [github][armv7hf-odroid-c1-node-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-node-dockerhub-tag-link] |
| resin/odroid-c1-python | [dockerhub][armv7hf-odroid-c1-python-dockerhub-link], [github][armv7hf-odroid-c1-python-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-python-dockerhub-tag-link] |
| resin/odroid-c1-golang | [dockerhub][armv7hf-odroid-c1-golang-dockerhub-link], [github][armv7hf-odroid-c1-golang-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-golang-dockerhub-tag-link] |
| resin/odroid-c1-openjdk | [dockerhub][armv7hf-odroid-c1-openjdk-dockerhub-link], [github][armv7hf-odroid-c1-openjdk-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-openjdk-dockerhub-tag-link] |
| resin/odroid-c1-alpine | [dockerhub][armv7hf-odroid-c1-alpine-dockerhub-link], [github][armv7hf-odroid-c1-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/odroid-c1-alpine-buildpack-deps | [dockerhub][armv7hf-odroid-c1-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-odroid-c1-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/odroid-c1-alpine-node | [dockerhub][armv7hf-odroid-c1-alpine-node-dockerhub-link], [github][armv7hf-odroid-c1-alpine-node-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-alpine-node-dockerhub-tag-link] |
| resin/odroid-c1-alpine-python | [dockerhub][armv7hf-odroid-c1-alpine-python-dockerhub-link], [github][armv7hf-odroid-c1-alpine-python-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-alpine-python-dockerhub-tag-link] |
| resin/odroid-c1-alpine-golang | [dockerhub][armv7hf-odroid-c1-alpine-golang-dockerhub-link], [github][armv7hf-odroid-c1-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-alpine-golang-dockerhub-tag-link] |
| resin/odroid-c1-alpine-openjdk | [dockerhub][armv7hf-odroid-c1-alpine-openjdk-dockerhub-link], [github][armv7hf-odroid-c1-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-alpine-openjdk-dockerhub-tag-link] |
| resin/odroid-c1-fedora | [dockerhub][armv7hf-odroid-c1-fedora-node-dockerhub-link], [github][armv7hf-odroid-c1-fedora-node-github-link] | latest, 24 |
| resin/odroid-c1-fedora-buildpack-deps | [dockerhub][armv7hf-odroid-c1-fedora-node-dockerhub-link], [github][armv7hf-odroid-c1-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/odroid-c1-fedora-node | [dockerhub][armv7hf-odroid-c1-fedora-node-dockerhub-link], [github][armv7hf-odroid-c1-fedora-node-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-fedora-node-dockerhub-tag-link] |
| resin/odroid-c1-fedora-python | [dockerhub][armv7hf-odroid-c1-fedora-python-dockerhub-link], [github][armv7hf-odroid-c1-fedora-python-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-fedora-python-dockerhub-tag-link] |
| resin/odroid-c1-fedora-golang | [dockerhub][armv7hf-odroid-c1-fedora-golang-dockerhub-link], [github][armv7hf-odroid-c1-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-fedora-golang-dockerhub-tag-link] |
| resin/odroid-c1-fedora-openjdk | [dockerhub][armv7hf-odroid-c1-fedora-openjdk-dockerhub-link], [github][armv7hf-odroid-c1-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-odroid-c1-fedora-openjdk-dockerhub-tag-link] |

##### ODROID-XU4

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/odroid-ux3-debian | [dockerhub][armv7hf-odroid-ux3-dockerhub-link], [github][armv7hf-odroid-ux3-github-link] | latest, jessie, wheezy |
| resin/odroid-ux3-buildpack-deps | [dockerhub][armv7hf-odroid-ux3-buildpack-deps-dockerhub-link], [github][armv7hf-odroid-ux3-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/odroid-ux3-node | [dockerhub][armv7hf-odroid-ux3-node-dockerhub-link], [github][armv7hf-odroid-ux3-node-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-node-dockerhub-tag-link] |
| resin/odroid-ux3-python | [dockerhub][armv7hf-odroid-ux3-python-dockerhub-link], [github][armv7hf-odroid-ux3-python-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-python-dockerhub-tag-link] |
| resin/odroid-ux3-golang | [dockerhub][armv7hf-odroid-ux3-golang-dockerhub-link], [github][armv7hf-odroid-ux3-golang-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-golang-dockerhub-tag-link] |
| resin/odroid-ux3-openjdk | [dockerhub][armv7hf-odroid-ux3-openjdk-dockerhub-link], [github][armv7hf-odroid-ux3-openjdk-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-openjdk-dockerhub-tag-link] |
| resin/odroid-ux3-alpine | [dockerhub][armv7hf-odroid-ux3-alpine-dockerhub-link], [github][armv7hf-odroid-ux3-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/odroid-ux3-alpine-buildpack-deps | [dockerhub][armv7hf-odroid-ux3-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-odroid-ux3-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/odroid-ux3-alpine-node | [dockerhub][armv7hf-odroid-ux3-alpine-node-dockerhub-link], [github][armv7hf-odroid-ux3-alpine-node-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-alpine-node-dockerhub-tag-link] |
| resin/odroid-ux3-alpine-python | [dockerhub][armv7hf-odroid-ux3-alpine-python-dockerhub-link], [github][armv7hf-odroid-ux3-alpine-python-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-alpine-python-dockerhub-tag-link] |
| resin/odroid-ux3-alpine-golang | [dockerhub][armv7hf-odroid-ux3-alpine-golang-dockerhub-link], [github][armv7hf-odroid-ux3-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-alpine-golang-dockerhub-tag-link] |
| resin/odroid-ux3-alpine-openjdk | [dockerhub][armv7hf-odroid-ux3-alpine-openjdk-dockerhub-link], [github][armv7hf-odroid-ux3-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-alpine-openjdk-dockerhub-tag-link] |
| resin/odroid-ux3-fedora | [dockerhub][armv7hf-odroid-ux3-fedora-node-dockerhub-link], [github][armv7hf-odroid-ux3-fedora-node-github-link] | latest, 24 |
| resin/odroid-ux3-fedora-buildpack-deps | [dockerhub][armv7hf-odroid-ux3-fedora-node-dockerhub-link], [github][armv7hf-odroid-ux3-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/odroid-ux3-fedora-node | [dockerhub][armv7hf-odroid-ux3-fedora-node-dockerhub-link], [github][armv7hf-odroid-ux3-fedora-node-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-fedora-node-dockerhub-tag-link] |
| resin/odroid-ux3-fedora-python | [dockerhub][armv7hf-odroid-ux3-fedora-python-dockerhub-link], [github][armv7hf-odroid-ux3-fedora-python-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-fedora-python-dockerhub-tag-link] |
| resin/odroid-ux3-fedora-golang | [dockerhub][armv7hf-odroid-ux3-fedora-golang-dockerhub-link], [github][armv7hf-odroid-ux3-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-fedora-golang-dockerhub-tag-link] |
| resin/odroid-ux3-fedora-openjdk | [dockerhub][armv7hf-odroid-ux3-fedora-openjdk-dockerhub-link], [github][armv7hf-odroid-ux3-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-odroid-ux3-fedora-openjdk-dockerhub-tag-link] |

##### Parallella

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/parallella-hdmi-resin-debian | [dockerhub][armv7hf-parallella-hdmi-resin-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-github-link] | latest, jessie, wheezy |
| resin/parallella-hdmi-resin-buildpack-deps | [dockerhub][armv7hf-parallella-hdmi-resin-buildpack-deps-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/parallella-hdmi-resin-node | [dockerhub][armv7hf-parallella-hdmi-resin-node-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-node-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-node-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-python | [dockerhub][armv7hf-parallella-hdmi-resin-python-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-python-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-python-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-golang | [dockerhub][armv7hf-parallella-hdmi-resin-golang-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-golang-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-golang-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-openjdk | [dockerhub][armv7hf-parallella-hdmi-resin-openjdk-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-openjdk-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-openjdk-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-alpine | [dockerhub][armv7hf-parallella-hdmi-resin-alpine-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/parallella-hdmi-resin-alpine-buildpack-deps | [dockerhub][armv7hf-parallella-hdmi-resin-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/parallella-hdmi-resin-alpine-node | [dockerhub][armv7hf-parallella-hdmi-resin-alpine-node-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-alpine-node-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-alpine-node-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-alpine-python | [dockerhub][armv7hf-parallella-hdmi-resin-alpine-python-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-alpine-python-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-alpine-python-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-alpine-golang | [dockerhub][armv7hf-parallella-hdmi-resin-alpine-golang-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-alpine-golang-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-alpine-openjdk | [dockerhub][armv7hf-parallella-hdmi-resin-alpine-openjdk-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-alpine-openjdk-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-fedora | [dockerhub][armv7hf-parallella-hdmi-resin-fedora-node-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-fedora-node-github-link] | latest, 24 |
| resin/parallella-hdmi-resin-fedora-buildpack-deps | [dockerhub][armv7hf-parallella-hdmi-resin-fedora-node-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/parallella-hdmi-resin-fedora-node | [dockerhub][armv7hf-parallella-hdmi-resin-fedora-node-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-fedora-node-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-fedora-node-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-fedora-python | [dockerhub][armv7hf-parallella-hdmi-resin-fedora-python-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-fedora-python-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-fedora-python-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-fedora-golang | [dockerhub][armv7hf-parallella-hdmi-resin-fedora-golang-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-fedora-golang-dockerhub-tag-link] |
| resin/parallella-hdmi-resin-fedora-openjdk | [dockerhub][armv7hf-parallella-hdmi-resin-fedora-openjdk-dockerhub-link], [github][armv7hf-parallella-hdmi-resin-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-parallella-hdmi-resin-fedora-openjdk-dockerhub-tag-link] |

##### Nitrogen 6X

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/nitrogen6x-debian | [dockerhub][armv7hf-nitrogen6x-dockerhub-link], [github][armv7hf-nitrogen6x-github-link] | latest, jessie, wheezy |
| resin/nitrogen6x-buildpack-deps | [dockerhub][armv7hf-nitrogen6x-buildpack-deps-dockerhub-link], [github][armv7hf-nitrogen6x-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/nitrogen6x-node | [dockerhub][armv7hf-nitrogen6x-node-dockerhub-link], [github][armv7hf-nitrogen6x-node-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-node-dockerhub-tag-link] |
| resin/nitrogen6x-python | [dockerhub][armv7hf-nitrogen6x-python-dockerhub-link], [github][armv7hf-nitrogen6x-python-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-python-dockerhub-tag-link] |
| resin/nitrogen6x-golang | [dockerhub][armv7hf-nitrogen6x-golang-dockerhub-link], [github][armv7hf-nitrogen6x-golang-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-golang-dockerhub-tag-link] |
| resin/nitrogen6x-openjdk | [dockerhub][armv7hf-nitrogen6x-openjdk-dockerhub-link], [github][armv7hf-nitrogen6x-openjdk-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-openjdk-dockerhub-tag-link] |
| resin/nitrogen6x-alpine | [dockerhub][armv7hf-nitrogen6x-alpine-dockerhub-link], [github][armv7hf-nitrogen6x-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/nitrogen6x-alpine-buildpack-deps | [dockerhub][armv7hf-nitrogen6x-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-nitrogen6x-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/nitrogen6x-alpine-node | [dockerhub][armv7hf-nitrogen6x-alpine-node-dockerhub-link], [github][armv7hf-nitrogen6x-alpine-node-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-alpine-node-dockerhub-tag-link] |
| resin/nitrogen6x-alpine-python | [dockerhub][armv7hf-nitrogen6x-alpine-python-dockerhub-link], [github][armv7hf-nitrogen6x-alpine-python-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-alpine-python-dockerhub-tag-link] |
| resin/nitrogen6x-alpine-golang | [dockerhub][armv7hf-nitrogen6x-alpine-golang-dockerhub-link], [github][armv7hf-nitrogen6x-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-alpine-golang-dockerhub-tag-link] |
| resin/nitrogen6x-alpine-openjdk | [dockerhub][armv7hf-nitrogen6x-alpine-openjdk-dockerhub-link], [github][armv7hf-nitrogen6x-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-alpine-openjdk-dockerhub-tag-link] |
| resin/nitrogen6x-fedora | [dockerhub][armv7hf-nitrogen6x-fedora-node-dockerhub-link], [github][armv7hf-nitrogen6x-fedora-node-github-link] | latest, 24 |
| resin/nitrogen6x-fedora-buildpack-deps | [dockerhub][armv7hf-nitrogen6x-fedora-node-dockerhub-link], [github][armv7hf-nitrogen6x-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/nitrogen6x-fedora-node | [dockerhub][armv7hf-nitrogen6x-fedora-node-dockerhub-link], [github][armv7hf-nitrogen6x-fedora-node-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-fedora-node-dockerhub-tag-link] |
| resin/nitrogen6x-fedora-python | [dockerhub][armv7hf-nitrogen6x-fedora-python-dockerhub-link], [github][armv7hf-nitrogen6x-fedora-python-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-fedora-python-dockerhub-tag-link] |
| resin/nitrogen6x-fedora-golang | [dockerhub][armv7hf-nitrogen6x-fedora-golang-dockerhub-link], [github][armv7hf-nitrogen6x-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-fedora-golang-dockerhub-tag-link] |
| resin/nitrogen6x-fedora-openjdk | [dockerhub][armv7hf-nitrogen6x-fedora-openjdk-dockerhub-link], [github][armv7hf-nitrogen6x-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-nitrogen6x-fedora-openjdk-dockerhub-tag-link] |

##### Hummingboard

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/cubox-i-debian | [dockerhub][armv7hf-cubox-i-dockerhub-link], [github][armv7hf-cubox-i-github-link] | latest, jessie, wheezy |
| resin/cubox-i-buildpack-deps | [dockerhub][armv7hf-cubox-i-buildpack-deps-dockerhub-link], [github][armv7hf-cubox-i-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/cubox-i-node | [dockerhub][armv7hf-cubox-i-node-dockerhub-link], [github][armv7hf-cubox-i-node-github-link] | For available image tags, refer [here][armv7hf-cubox-i-node-dockerhub-tag-link] |
| resin/cubox-i-python | [dockerhub][armv7hf-cubox-i-python-dockerhub-link], [github][armv7hf-cubox-i-python-github-link] | For available image tags, refer [here][armv7hf-cubox-i-python-dockerhub-tag-link] |
| resin/cubox-i-golang | [dockerhub][armv7hf-cubox-i-golang-dockerhub-link], [github][armv7hf-cubox-i-golang-github-link] | For available image tags, refer [here][armv7hf-cubox-i-golang-dockerhub-tag-link] |
| resin/cubox-i-openjdk | [dockerhub][armv7hf-cubox-i-openjdk-dockerhub-link], [github][armv7hf-cubox-i-openjdk-github-link] | For available image tags, refer [here][armv7hf-cubox-i-openjdk-dockerhub-tag-link] |
| resin/cubox-i-alpine | [dockerhub][armv7hf-cubox-i-alpine-dockerhub-link], [github][armv7hf-cubox-i-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/cubox-i-alpine-buildpack-deps | [dockerhub][armv7hf-cubox-i-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-cubox-i-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/cubox-i-alpine-node | [dockerhub][armv7hf-cubox-i-alpine-node-dockerhub-link], [github][armv7hf-cubox-i-alpine-node-github-link] | For available image tags, refer [here][armv7hf-cubox-i-alpine-node-dockerhub-tag-link] |
| resin/cubox-i-alpine-python | [dockerhub][armv7hf-cubox-i-alpine-python-dockerhub-link], [github][armv7hf-cubox-i-alpine-python-github-link] | For available image tags, refer [here][armv7hf-cubox-i-alpine-python-dockerhub-tag-link] |
| resin/cubox-i-alpine-golang | [dockerhub][armv7hf-cubox-i-alpine-golang-dockerhub-link], [github][armv7hf-cubox-i-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-cubox-i-alpine-golang-dockerhub-tag-link] |
| resin/cubox-i-alpine-openjdk | [dockerhub][armv7hf-cubox-i-alpine-openjdk-dockerhub-link], [github][armv7hf-cubox-i-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-cubox-i-alpine-openjdk-dockerhub-tag-link] |
| resin/cubox-i-fedora | [dockerhub][armv7hf-cubox-i-fedora-node-dockerhub-link], [github][armv7hf-cubox-i-fedora-node-github-link] | latest, 24 |
| resin/cubox-i-fedora-buildpack-deps | [dockerhub][armv7hf-cubox-i-fedora-node-dockerhub-link], [github][armv7hf-cubox-i-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/cubox-i-fedora-node | [dockerhub][armv7hf-cubox-i-fedora-node-dockerhub-link], [github][armv7hf-cubox-i-fedora-node-github-link] | For available image tags, refer [here][armv7hf-cubox-i-fedora-node-dockerhub-tag-link] |
| resin/cubox-i-fedora-python | [dockerhub][armv7hf-cubox-i-fedora-python-dockerhub-link], [github][armv7hf-cubox-i-fedora-python-github-link] | For available image tags, refer [here][armv7hf-cubox-i-fedora-python-dockerhub-tag-link] |
| resin/cubox-i-fedora-golang | [dockerhub][armv7hf-cubox-i-fedora-golang-dockerhub-link], [github][armv7hf-cubox-i-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-cubox-i-fedora-golang-dockerhub-tag-link] |
| resin/cubox-i-fedora-openjdk | [dockerhub][armv7hf-cubox-i-fedora-openjdk-dockerhub-link], [github][armv7hf-cubox-i-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-cubox-i-fedora-openjdk-dockerhub-tag-link] |

##### Colibri iMX6dl

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/colibri-imx6-debian | [dockerhub][armv7hf-colibri-imx6-dockerhub-link], [github][armv7hf-colibri-imx6-github-link] | latest, jessie, wheezy |
| resin/colibri-imx6-buildpack-deps | [dockerhub][armv7hf-colibri-imx6-buildpack-deps-dockerhub-link], [github][armv7hf-colibri-imx6-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/colibri-imx6-node | [dockerhub][armv7hf-colibri-imx6-node-dockerhub-link], [github][armv7hf-colibri-imx6-node-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-node-dockerhub-tag-link] |
| resin/colibri-imx6-python | [dockerhub][armv7hf-colibri-imx6-python-dockerhub-link], [github][armv7hf-colibri-imx6-python-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-python-dockerhub-tag-link] |
| resin/colibri-imx6-golang | [dockerhub][armv7hf-colibri-imx6-golang-dockerhub-link], [github][armv7hf-colibri-imx6-golang-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-golang-dockerhub-tag-link] |
| resin/colibri-imx6-openjdk | [dockerhub][armv7hf-colibri-imx6-openjdk-dockerhub-link], [github][armv7hf-colibri-imx6-openjdk-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-openjdk-dockerhub-tag-link] |
| resin/colibri-imx6-alpine | [dockerhub][armv7hf-colibri-imx6-alpine-dockerhub-link], [github][armv7hf-colibri-imx6-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/colibri-imx6-alpine-buildpack-deps | [dockerhub][armv7hf-colibri-imx6-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-colibri-imx6-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/colibri-imx6-alpine-node | [dockerhub][armv7hf-colibri-imx6-alpine-node-dockerhub-link], [github][armv7hf-colibri-imx6-alpine-node-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-alpine-node-dockerhub-tag-link] |
| resin/colibri-imx6-alpine-python | [dockerhub][armv7hf-colibri-imx6-alpine-python-dockerhub-link], [github][armv7hf-colibri-imx6-alpine-python-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-alpine-python-dockerhub-tag-link] |
| resin/colibri-imx6-alpine-golang | [dockerhub][armv7hf-colibri-imx6-alpine-golang-dockerhub-link], [github][armv7hf-colibri-imx6-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-alpine-golang-dockerhub-tag-link] |
| resin/colibri-imx6-alpine-openjdk | [dockerhub][armv7hf-colibri-imx6-alpine-openjdk-dockerhub-link], [github][armv7hf-colibri-imx6-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-alpine-openjdk-dockerhub-tag-link] |
| resin/colibri-imx6-fedora | [dockerhub][armv7hf-colibri-imx6-fedora-node-dockerhub-link], [github][armv7hf-colibri-imx6-fedora-node-github-link] | latest, 24 |
| resin/colibri-imx6-fedora-buildpack-deps | [dockerhub][armv7hf-colibri-imx6-fedora-node-dockerhub-link], [github][armv7hf-colibri-imx6-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/colibri-imx6-fedora-node | [dockerhub][armv7hf-colibri-imx6-fedora-node-dockerhub-link], [github][armv7hf-colibri-imx6-fedora-node-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-fedora-node-dockerhub-tag-link] |
| resin/colibri-imx6-fedora-python | [dockerhub][armv7hf-colibri-imx6-fedora-python-dockerhub-link], [github][armv7hf-colibri-imx6-fedora-python-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-fedora-python-dockerhub-tag-link] |
| resin/colibri-imx6-fedora-golang | [dockerhub][armv7hf-colibri-imx6-fedora-golang-dockerhub-link], [github][armv7hf-colibri-imx6-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-fedora-golang-dockerhub-tag-link] |
| resin/colibri-imx6-fedora-openjdk | [dockerhub][armv7hf-colibri-imx6-fedora-openjdk-dockerhub-link], [github][armv7hf-colibri-imx6-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-colibri-imx6-fedora-openjdk-dockerhub-tag-link] |

##### Apslis iMX6q

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/apalis-imx6-debian | [dockerhub][armv7hf-apalis-imx6-dockerhub-link], [github][armv7hf-apalis-imx6-github-link] | latest, jessie, wheezy |
| resin/apalis-imx6-buildpack-deps | [dockerhub][armv7hf-apalis-imx6-buildpack-deps-dockerhub-link], [github][armv7hf-apalis-imx6-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/apalis-imx6-node | [dockerhub][armv7hf-apalis-imx6-node-dockerhub-link], [github][armv7hf-apalis-imx6-node-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-node-dockerhub-tag-link] |
| resin/apalis-imx6-python | [dockerhub][armv7hf-apalis-imx6-python-dockerhub-link], [github][armv7hf-apalis-imx6-python-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-python-dockerhub-tag-link] |
| resin/apalis-imx6-golang | [dockerhub][armv7hf-apalis-imx6-golang-dockerhub-link], [github][armv7hf-apalis-imx6-golang-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-golang-dockerhub-tag-link] |
| resin/apalis-imx6-openjdk | [dockerhub][armv7hf-apalis-imx6-openjdk-dockerhub-link], [github][armv7hf-apalis-imx6-openjdk-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-openjdk-dockerhub-tag-link] |
| resin/apalis-imx6-alpine | [dockerhub][armv7hf-apalis-imx6-alpine-dockerhub-link], [github][armv7hf-apalis-imx6-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/apalis-imx6-alpine-buildpack-deps | [dockerhub][armv7hf-apalis-imx6-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-apalis-imx6-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/apalis-imx6-alpine-node | [dockerhub][armv7hf-apalis-imx6-alpine-node-dockerhub-link], [github][armv7hf-apalis-imx6-alpine-node-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-alpine-node-dockerhub-tag-link] |
| resin/apalis-imx6-alpine-python | [dockerhub][armv7hf-apalis-imx6-alpine-python-dockerhub-link], [github][armv7hf-apalis-imx6-alpine-python-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-alpine-python-dockerhub-tag-link] |
| resin/apalis-imx6-alpine-golang | [dockerhub][armv7hf-apalis-imx6-alpine-golang-dockerhub-link], [github][armv7hf-apalis-imx6-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-alpine-golang-dockerhub-tag-link] |
| resin/apalis-imx6-alpine-openjdk | [dockerhub][armv7hf-apalis-imx6-alpine-openjdk-dockerhub-link], [github][armv7hf-apalis-imx6-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-alpine-openjdk-dockerhub-tag-link] |
| resin/apalis-imx6-fedora | [dockerhub][armv7hf-apalis-imx6-fedora-node-dockerhub-link], [github][armv7hf-apalis-imx6-fedora-node-github-link] | latest, 24 |
| resin/apalis-imx6-fedora-buildpack-deps | [dockerhub][armv7hf-apalis-imx6-fedora-node-dockerhub-link], [github][armv7hf-apalis-imx6-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/apalis-imx6-fedora-node | [dockerhub][armv7hf-apalis-imx6-fedora-node-dockerhub-link], [github][armv7hf-apalis-imx6-fedora-node-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-fedora-node-dockerhub-tag-link] |
| resin/apalis-imx6-fedora-python | [dockerhub][armv7hf-apalis-imx6-fedora-python-dockerhub-link], [github][armv7hf-apalis-imx6-fedora-python-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-fedora-python-dockerhub-tag-link] |
| resin/apalis-imx6-fedora-golang | [dockerhub][armv7hf-apalis-imx6-fedora-golang-dockerhub-link], [github][armv7hf-apalis-imx6-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-fedora-golang-dockerhub-tag-link] |
| resin/apalis-imx6-fedora-openjdk | [dockerhub][armv7hf-apalis-imx6-fedora-openjdk-dockerhub-link], [github][armv7hf-apalis-imx6-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-apalis-imx6-fedora-openjdk-dockerhub-tag-link] |

##### TS-4900

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/ts4900-debian | [dockerhub][armv7hf-ts4900-dockerhub-link], [github][armv7hf-ts4900-github-link] | latest, jessie, wheezy |
| resin/ts4900-buildpack-deps | [dockerhub][armv7hf-ts4900-buildpack-deps-dockerhub-link], [github][armv7hf-ts4900-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/ts4900-node | [dockerhub][armv7hf-ts4900-node-dockerhub-link], [github][armv7hf-ts4900-node-github-link] | For available image tags, refer [here][armv7hf-ts4900-node-dockerhub-tag-link] |
| resin/ts4900-python | [dockerhub][armv7hf-ts4900-python-dockerhub-link], [github][armv7hf-ts4900-python-github-link] | For available image tags, refer [here][armv7hf-ts4900-python-dockerhub-tag-link] |
| resin/ts4900-golang | [dockerhub][armv7hf-ts4900-golang-dockerhub-link], [github][armv7hf-ts4900-golang-github-link] | For available image tags, refer [here][armv7hf-ts4900-golang-dockerhub-tag-link] |
| resin/ts4900-openjdk | [dockerhub][armv7hf-ts4900-openjdk-dockerhub-link], [github][armv7hf-ts4900-openjdk-github-link] | For available image tags, refer [here][armv7hf-ts4900-openjdk-dockerhub-tag-link] |
| resin/ts4900-alpine | [dockerhub][armv7hf-ts4900-alpine-dockerhub-link], [github][armv7hf-ts4900-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/ts4900-alpine-buildpack-deps | [dockerhub][armv7hf-ts4900-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-ts4900-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/ts4900-alpine-node | [dockerhub][armv7hf-ts4900-alpine-node-dockerhub-link], [github][armv7hf-ts4900-alpine-node-github-link] | For available image tags, refer [here][armv7hf-ts4900-alpine-node-dockerhub-tag-link] |
| resin/ts4900-alpine-python | [dockerhub][armv7hf-ts4900-alpine-python-dockerhub-link], [github][armv7hf-ts4900-alpine-python-github-link] | For available image tags, refer [here][armv7hf-ts4900-alpine-python-dockerhub-tag-link] |
| resin/ts4900-alpine-golang | [dockerhub][armv7hf-ts4900-alpine-golang-dockerhub-link], [github][armv7hf-ts4900-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-ts4900-alpine-golang-dockerhub-tag-link] |
| resin/ts4900-alpine-openjdk | [dockerhub][armv7hf-ts4900-alpine-openjdk-dockerhub-link], [github][armv7hf-ts4900-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-ts4900-alpine-openjdk-dockerhub-tag-link] |
| resin/ts4900-fedora | [dockerhub][armv7hf-ts4900-fedora-node-dockerhub-link], [github][armv7hf-ts4900-fedora-node-github-link] | latest, 24 |
| resin/ts4900-fedora-buildpack-deps | [dockerhub][armv7hf-ts4900-fedora-node-dockerhub-link], [github][armv7hf-ts4900-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/ts4900-fedora-node | [dockerhub][armv7hf-ts4900-fedora-node-dockerhub-link], [github][armv7hf-ts4900-fedora-node-github-link] | For available image tags, refer [here][armv7hf-ts4900-fedora-node-dockerhub-tag-link] |
| resin/ts4900-fedora-python | [dockerhub][armv7hf-ts4900-fedora-python-dockerhub-link], [github][armv7hf-ts4900-fedora-python-github-link] | For available image tags, refer [here][armv7hf-ts4900-fedora-python-dockerhub-tag-link] |
| resin/ts4900-fedora-golang | [dockerhub][armv7hf-ts4900-fedora-golang-dockerhub-link], [github][armv7hf-ts4900-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-ts4900-fedora-golang-dockerhub-tag-link] |
| resin/ts4900-fedora-openjdk | [dockerhub][armv7hf-ts4900-fedora-openjdk-dockerhub-link], [github][armv7hf-ts4900-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-ts4900-fedora-openjdk-dockerhub-tag-link] |

##### Samsung Artik 5

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/artik5-debian | [dockerhub][armv7hf-artik5-dockerhub-link], [github][armv7hf-artik5-github-link] | latest, jessie, wheezy |
| resin/artik5-buildpack-deps | [dockerhub][armv7hf-artik5-buildpack-deps-dockerhub-link], [github][armv7hf-artik5-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/artik5-node | [dockerhub][armv7hf-artik5-node-dockerhub-link], [github][armv7hf-artik5-node-github-link] | For available image tags, refer [here][armv7hf-artik5-node-dockerhub-tag-link] |
| resin/artik5-python | [dockerhub][armv7hf-artik5-python-dockerhub-link], [github][armv7hf-artik5-python-github-link] | For available image tags, refer [here][armv7hf-artik5-python-dockerhub-tag-link] |
| resin/artik5-golang | [dockerhub][armv7hf-artik5-golang-dockerhub-link], [github][armv7hf-artik5-golang-github-link] | For available image tags, refer [here][armv7hf-artik5-golang-dockerhub-tag-link] |
| resin/artik5-openjdk | [dockerhub][armv7hf-artik5-openjdk-dockerhub-link], [github][armv7hf-artik5-openjdk-github-link] | For available image tags, refer [here][armv7hf-artik5-openjdk-dockerhub-tag-link] |
| resin/artik5-alpine | [dockerhub][armv7hf-artik5-alpine-dockerhub-link], [github][armv7hf-artik5-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/artik5-alpine-buildpack-deps | [dockerhub][armv7hf-artik5-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-artik5-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/artik5-alpine-node | [dockerhub][armv7hf-artik5-alpine-node-dockerhub-link], [github][armv7hf-artik5-alpine-node-github-link] | For available image tags, refer [here][armv7hf-artik5-alpine-node-dockerhub-tag-link] |
| resin/artik5-alpine-python | [dockerhub][armv7hf-artik5-alpine-python-dockerhub-link], [github][armv7hf-artik5-alpine-python-github-link] | For available image tags, refer [here][armv7hf-artik5-alpine-python-dockerhub-tag-link] |
| resin/artik5-alpine-golang | [dockerhub][armv7hf-artik5-alpine-golang-dockerhub-link], [github][armv7hf-artik5-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-artik5-alpine-golang-dockerhub-tag-link] |
| resin/artik5-alpine-openjdk | [dockerhub][armv7hf-artik5-alpine-openjdk-dockerhub-link], [github][armv7hf-artik5-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-artik5-alpine-openjdk-dockerhub-tag-link] |
| resin/artik5-fedora | [dockerhub][armv7hf-artik5-fedora-node-dockerhub-link], [github][armv7hf-artik5-fedora-node-github-link] | latest, 24 |
| resin/artik5-fedora-buildpack-deps | [dockerhub][armv7hf-artik5-fedora-node-dockerhub-link], [github][armv7hf-artik5-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/artik5-fedora-node | [dockerhub][armv7hf-artik5-fedora-node-dockerhub-link], [github][armv7hf-artik5-fedora-node-github-link] | For available image tags, refer [here][armv7hf-artik5-fedora-node-dockerhub-tag-link] |
| resin/artik5-fedora-python | [dockerhub][armv7hf-artik5-fedora-python-dockerhub-link], [github][armv7hf-artik5-fedora-python-github-link] | For available image tags, refer [here][armv7hf-artik5-fedora-python-dockerhub-tag-link] |
| resin/artik5-fedora-golang | [dockerhub][armv7hf-artik5-fedora-golang-dockerhub-link], [github][armv7hf-artik5-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-artik5-fedora-golang-dockerhub-tag-link] |
| resin/artik5-fedora-openjdk | [dockerhub][armv7hf-artik5-fedora-openjdk-dockerhub-link], [github][armv7hf-artik5-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-artik5-fedora-openjdk-dockerhub-tag-link] |

##### Samsung Artik 10

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/artik10-debian | [dockerhub][armv7hf-artik10-dockerhub-link], [github][armv7hf-artik10-github-link] | latest, jessie, wheezy |
| resin/artik10-buildpack-deps | [dockerhub][armv7hf-artik10-buildpack-deps-dockerhub-link], [github][armv7hf-artik10-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/artik10-node | [dockerhub][armv7hf-artik10-node-dockerhub-link], [github][armv7hf-artik10-node-github-link] | For available image tags, refer [here][armv7hf-artik10-node-dockerhub-tag-link] |
| resin/artik10-python | [dockerhub][armv7hf-artik10-python-dockerhub-link], [github][armv7hf-artik10-python-github-link] | For available image tags, refer [here][armv7hf-artik10-python-dockerhub-tag-link] |
| resin/artik10-golang | [dockerhub][armv7hf-artik10-golang-dockerhub-link], [github][armv7hf-artik10-golang-github-link] | For available image tags, refer [here][armv7hf-artik10-golang-dockerhub-tag-link] |
| resin/artik10-openjdk | [dockerhub][armv7hf-artik10-openjdk-dockerhub-link], [github][armv7hf-artik10-openjdk-github-link] | For available image tags, refer [here][armv7hf-artik10-openjdk-dockerhub-tag-link] |
| resin/artik10-alpine | [dockerhub][armv7hf-artik10-alpine-dockerhub-link], [github][armv7hf-artik10-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/artik10-alpine-buildpack-deps | [dockerhub][armv7hf-artik10-alpine-buildpack-deps-dockerhub-link], [github][armv7hf-artik10-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/artik10-alpine-node | [dockerhub][armv7hf-artik10-alpine-node-dockerhub-link], [github][armv7hf-artik10-alpine-node-github-link] | For available image tags, refer [here][armv7hf-artik10-alpine-node-dockerhub-tag-link] |
| resin/artik10-alpine-python | [dockerhub][armv7hf-artik10-alpine-python-dockerhub-link], [github][armv7hf-artik10-alpine-python-github-link] | For available image tags, refer [here][armv7hf-artik10-alpine-python-dockerhub-tag-link] |
| resin/artik10-alpine-golang | [dockerhub][armv7hf-artik10-alpine-golang-dockerhub-link], [github][armv7hf-artik10-alpine-golang-github-link] | For available image tags, refer [here][armv7hf-artik10-alpine-golang-dockerhub-tag-link] |
| resin/artik10-alpine-openjdk | [dockerhub][armv7hf-artik10-alpine-openjdk-dockerhub-link], [github][armv7hf-artik10-alpine-openjdk-github-link] | For available image tags, refer [here][armv7hf-artik10-alpine-openjdk-dockerhub-tag-link] |
| resin/artik10-fedora | [dockerhub][armv7hf-artik10-fedora-node-dockerhub-link], [github][armv7hf-artik10-fedora-node-github-link] | latest, 24 |
| resin/artik10-fedora-buildpack-deps | [dockerhub][armv7hf-artik10-fedora-node-dockerhub-link], [github][armv7hf-artik10-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/artik10-fedora-node | [dockerhub][armv7hf-artik10-fedora-node-dockerhub-link], [github][armv7hf-artik10-fedora-node-github-link] | For available image tags, refer [here][armv7hf-artik10-fedora-node-dockerhub-tag-link] |
| resin/artik10-fedora-python | [dockerhub][armv7hf-artik10-fedora-python-dockerhub-link], [github][armv7hf-artik10-fedora-python-github-link] | For available image tags, refer [here][armv7hf-artik10-fedora-python-dockerhub-tag-link] |
| resin/artik10-fedora-golang | [dockerhub][armv7hf-artik10-fedora-golang-dockerhub-link], [github][armv7hf-artik10-fedora-golang-github-link] | For available image tags, refer [here][armv7hf-artik10-fedora-golang-dockerhub-tag-link] |
| resin/artik10-fedora-openjdk | [dockerhub][armv7hf-artik10-fedora-openjdk-dockerhub-link], [github][armv7hf-artik10-fedora-openjdk-github-link] | For available image tags, refer [here][armv7hf-artik10-fedora-openjdk-dockerhub-tag-link] |

### i386

![i386 Tree Diagram](/img/i386-devices.jpg)



##### Intel Edison

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/edison-debian | [dockerhub][i386-edison-dockerhub-link], [github][i386-edison-github-link] | latest, jessie, wheezy |
| resin/edison-buildpack-deps | [dockerhub][i386-edison-buildpack-deps-dockerhub-link], [github][i386-edison-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/edison-node | [dockerhub][i386-edison-node-dockerhub-link], [github][i386-edison-node-github-link] | For available image tags, refer [here][i386-edison-node-dockerhub-tag-link] |
| resin/edison-python | [dockerhub][i386-edison-python-dockerhub-link], [github][i386-edison-python-github-link] | For available image tags, refer [here][i386-edison-python-dockerhub-tag-link] |
| resin/edison-golang | [dockerhub][i386-edison-golang-dockerhub-link], [github][i386-edison-golang-github-link] | For available image tags, refer [here][i386-edison-golang-dockerhub-tag-link] |
| resin/edison-openjdk | [dockerhub][i386-edison-openjdk-dockerhub-link], [github][i386-edison-openjdk-github-link] | For available image tags, refer [here][i386-edison-openjdk-dockerhub-tag-link] |
| resin/edison-alpine | [dockerhub][i386-edison-alpine-dockerhub-link], [github][i386-edison-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/edison-alpine-buildpack-deps | [dockerhub][i386-edison-alpine-buildpack-deps-dockerhub-link], [github][i386-edison-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/edison-alpine-node | [dockerhub][i386-edison-alpine-node-dockerhub-link], [github][i386-edison-alpine-node-github-link] | For available image tags, refer [here][i386-edison-alpine-node-dockerhub-tag-link] |
| resin/edison-alpine-python | [dockerhub][i386-edison-alpine-python-dockerhub-link], [github][i386-edison-alpine-python-github-link] | For available image tags, refer [here][i386-edison-alpine-python-dockerhub-tag-link] |
| resin/edison-alpine-golang | [dockerhub][i386-edison-alpine-golang-dockerhub-link], [github][i386-edison-alpine-golang-github-link] | For available image tags, refer [here][i386-edison-alpine-golang-dockerhub-tag-link] |
| resin/edison-alpine-openjdk | [dockerhub][i386-edison-alpine-openjdk-dockerhub-link], [github][i386-edison-alpine-openjdk-github-link] | For available image tags, refer [here][i386-edison-alpine-openjdk-dockerhub-tag-link] |

##### QEMU x86

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/qemux86-debian | [dockerhub][i386-qemux86-dockerhub-link], [github][i386-qemux86-github-link] | latest, jessie, wheezy |
| resin/qemux86-buildpack-deps | [dockerhub][i386-qemux86-buildpack-deps-dockerhub-link], [github][i386-qemux86-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/qemux86-node | [dockerhub][i386-qemux86-node-dockerhub-link], [github][i386-qemux86-node-github-link] | For available image tags, refer [here][i386-qemux86-node-dockerhub-tag-link] |
| resin/qemux86-python | [dockerhub][i386-qemux86-python-dockerhub-link], [github][i386-qemux86-python-github-link] | For available image tags, refer [here][i386-qemux86-python-dockerhub-tag-link] |
| resin/qemux86-golang | [dockerhub][i386-qemux86-golang-dockerhub-link], [github][i386-qemux86-golang-github-link] | For available image tags, refer [here][i386-qemux86-golang-dockerhub-tag-link] |
| resin/qemux86-openjdk | [dockerhub][i386-qemux86-openjdk-dockerhub-link], [github][i386-qemux86-openjdk-github-link] | For available image tags, refer [here][i386-qemux86-openjdk-dockerhub-tag-link] |
| resin/qemux86-alpine | [dockerhub][i386-qemux86-alpine-dockerhub-link], [github][i386-qemux86-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/qemux86-alpine-buildpack-deps | [dockerhub][i386-qemux86-alpine-buildpack-deps-dockerhub-link], [github][i386-qemux86-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/qemux86-alpine-node | [dockerhub][i386-qemux86-alpine-node-dockerhub-link], [github][i386-qemux86-alpine-node-github-link] | For available image tags, refer [here][i386-qemux86-alpine-node-dockerhub-tag-link] |
| resin/qemux86-alpine-python | [dockerhub][i386-qemux86-alpine-python-dockerhub-link], [github][i386-qemux86-alpine-python-github-link] | For available image tags, refer [here][i386-qemux86-alpine-python-dockerhub-tag-link] |
| resin/qemux86-alpine-golang | [dockerhub][i386-qemux86-alpine-golang-dockerhub-link], [github][i386-qemux86-alpine-golang-github-link] | For available image tags, refer [here][i386-qemux86-alpine-golang-dockerhub-tag-link] |
| resin/qemux86-alpine-openjdk | [dockerhub][i386-qemux86-alpine-openjdk-dockerhub-link], [github][i386-qemux86-alpine-openjdk-github-link] | For available image tags, refer [here][i386-qemux86-alpine-openjdk-dockerhub-tag-link] |

### amd64

![amd64 Tree Diagram](/img/amd64-devices.jpg)



##### Intel NUC

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/nuc-debian | [dockerhub][amd64-nuc-dockerhub-link], [github][amd64-nuc-github-link] | latest, jessie, wheezy |
| resin/nuc-buildpack-deps | [dockerhub][amd64-nuc-buildpack-deps-dockerhub-link], [github][amd64-nuc-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/nuc-node | [dockerhub][amd64-nuc-node-dockerhub-link], [github][amd64-nuc-node-github-link] | For available image tags, refer [here][amd64-nuc-node-dockerhub-tag-link] |
| resin/nuc-python | [dockerhub][amd64-nuc-python-dockerhub-link], [github][amd64-nuc-python-github-link] | For available image tags, refer [here][amd64-nuc-python-dockerhub-tag-link] |
| resin/nuc-golang | [dockerhub][amd64-nuc-golang-dockerhub-link], [github][amd64-nuc-golang-github-link] | For available image tags, refer [here][amd64-nuc-golang-dockerhub-tag-link] |
| resin/nuc-openjdk | [dockerhub][amd64-nuc-openjdk-dockerhub-link], [github][amd64-nuc-openjdk-github-link] | For available image tags, refer [here][amd64-nuc-openjdk-dockerhub-tag-link] |
| resin/nuc-alpine | [dockerhub][amd64-nuc-alpine-dockerhub-link], [github][amd64-nuc-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/nuc-alpine-buildpack-deps | [dockerhub][amd64-nuc-alpine-buildpack-deps-dockerhub-link], [github][amd64-nuc-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/nuc-alpine-node | [dockerhub][amd64-nuc-alpine-node-dockerhub-link], [github][amd64-nuc-alpine-node-github-link] | For available image tags, refer [here][amd64-nuc-alpine-node-dockerhub-tag-link] |
| resin/nuc-alpine-python | [dockerhub][amd64-nuc-alpine-python-dockerhub-link], [github][amd64-nuc-alpine-python-github-link] | For available image tags, refer [here][amd64-nuc-alpine-python-dockerhub-tag-link] |
| resin/nuc-alpine-golang | [dockerhub][amd64-nuc-alpine-golang-dockerhub-link], [github][amd64-nuc-alpine-golang-github-link] | For available image tags, refer [here][amd64-nuc-alpine-golang-dockerhub-tag-link] |
| resin/nuc-alpine-openjdk | [dockerhub][amd64-nuc-alpine-openjdk-dockerhub-link], [github][amd64-nuc-alpine-openjdk-github-link] | For available image tags, refer [here][amd64-nuc-alpine-openjdk-dockerhub-tag-link] |
| resin/nuc-fedora | [dockerhub][amd64-nuc-fedora-node-dockerhub-link], [github][amd64-nuc-fedora-node-github-link] | latest, 24 |
| resin/nuc-fedora-buildpack-deps | [dockerhub][amd64-nuc-fedora-node-dockerhub-link], [github][amd64-nuc-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/nuc-fedora-node | [dockerhub][amd64-nuc-fedora-node-dockerhub-link], [github][amd64-nuc-fedora-node-github-link] | For available image tags, refer [here][amd64-nuc-fedora-node-dockerhub-tag-link] |
| resin/nuc-fedora-python | [dockerhub][amd64-nuc-fedora-python-dockerhub-link], [github][amd64-nuc-fedora-python-github-link] | For available image tags, refer [here][amd64-nuc-fedora-python-dockerhub-tag-link] |
| resin/nuc-fedora-golang | [dockerhub][amd64-nuc-fedora-golang-dockerhub-link], [github][amd64-nuc-fedora-golang-github-link] | For available image tags, refer [here][amd64-nuc-fedora-golang-dockerhub-tag-link] |
| resin/nuc-fedora-openjdk | [dockerhub][amd64-nuc-fedora-openjdk-dockerhub-link], [github][amd64-nuc-fedora-openjdk-github-link] | For available image tags, refer [here][amd64-nuc-fedora-openjdk-dockerhub-tag-link] |

##### QEMU x86-64

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/qemux86-64-debian | [dockerhub][amd64-qemux86-64-dockerhub-link], [github][amd64-qemux86-64-github-link] | latest, jessie, wheezy |
| resin/qemux86-64-buildpack-deps | [dockerhub][amd64-qemux86-64-buildpack-deps-dockerhub-link], [github][amd64-qemux86-64-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/qemux86-64-node | [dockerhub][amd64-qemux86-64-node-dockerhub-link], [github][amd64-qemux86-64-node-github-link] | For available image tags, refer [here][amd64-qemux86-64-node-dockerhub-tag-link] |
| resin/qemux86-64-python | [dockerhub][amd64-qemux86-64-python-dockerhub-link], [github][amd64-qemux86-64-python-github-link] | For available image tags, refer [here][amd64-qemux86-64-python-dockerhub-tag-link] |
| resin/qemux86-64-golang | [dockerhub][amd64-qemux86-64-golang-dockerhub-link], [github][amd64-qemux86-64-golang-github-link] | For available image tags, refer [here][amd64-qemux86-64-golang-dockerhub-tag-link] |
| resin/qemux86-64-openjdk | [dockerhub][amd64-qemux86-64-openjdk-dockerhub-link], [github][amd64-qemux86-64-openjdk-github-link] | For available image tags, refer [here][amd64-qemux86-64-openjdk-dockerhub-tag-link] |
| resin/qemux86-64-alpine | [dockerhub][amd64-qemux86-64-alpine-dockerhub-link], [github][amd64-qemux86-64-alpine-github-link] | latest, 3.3, 3.2, edge |
| resin/qemux86-64-alpine-buildpack-deps | [dockerhub][amd64-qemux86-64-alpine-buildpack-deps-dockerhub-link], [github][amd64-qemux86-64-alpine-buildpack-deps-github-link] | latest, 3.3, edge, 3.3-scm, edge-scm, 3.3-curl, edge-curl |
| resin/qemux86-64-alpine-node | [dockerhub][amd64-qemux86-64-alpine-node-dockerhub-link], [github][amd64-qemux86-64-alpine-node-github-link] | For available image tags, refer [here][amd64-qemux86-64-alpine-node-dockerhub-tag-link] |
| resin/qemux86-64-alpine-python | [dockerhub][amd64-qemux86-64-alpine-python-dockerhub-link], [github][amd64-qemux86-64-alpine-python-github-link] | For available image tags, refer [here][amd64-qemux86-64-alpine-python-dockerhub-tag-link] |
| resin/qemux86-64-alpine-golang | [dockerhub][amd64-qemux86-64-alpine-golang-dockerhub-link], [github][amd64-qemux86-64-alpine-golang-github-link] | For available image tags, refer [here][amd64-qemux86-64-alpine-golang-dockerhub-tag-link] |
| resin/qemux86-64-alpine-openjdk | [dockerhub][amd64-qemux86-64-alpine-openjdk-dockerhub-link], [github][amd64-qemux86-64-alpine-openjdk-github-link] | For available image tags, refer [here][amd64-qemux86-64-alpine-openjdk-dockerhub-tag-link] |
| resin/qemux86-64-fedora | [dockerhub][amd64-qemux86-64-fedora-node-dockerhub-link], [github][amd64-qemux86-64-fedora-node-github-link] | latest, 24 |
| resin/qemux86-64-fedora-buildpack-deps | [dockerhub][amd64-qemux86-64-fedora-node-dockerhub-link], [github][amd64-qemux86-64-fedora-node-github-link] | latest, 24, 24-scm, 24-curl |
| resin/qemux86-64-fedora-node | [dockerhub][amd64-qemux86-64-fedora-node-dockerhub-link], [github][amd64-qemux86-64-fedora-node-github-link] | For available image tags, refer [here][amd64-qemux86-64-fedora-node-dockerhub-tag-link] |
| resin/qemux86-64-fedora-python | [dockerhub][amd64-qemux86-64-fedora-python-dockerhub-link], [github][amd64-qemux86-64-fedora-python-github-link] | For available image tags, refer [here][amd64-qemux86-64-fedora-python-dockerhub-tag-link] |
| resin/qemux86-64-fedora-golang | [dockerhub][amd64-qemux86-64-fedora-golang-dockerhub-link], [github][amd64-qemux86-64-fedora-golang-github-link] | For available image tags, refer [here][amd64-qemux86-64-fedora-golang-dockerhub-tag-link] |
| resin/qemux86-64-fedora-openjdk | [dockerhub][amd64-qemux86-64-fedora-openjdk-dockerhub-link], [github][amd64-qemux86-64-fedora-openjdk-github-link] | For available image tags, refer [here][amd64-qemux86-64-fedora-openjdk-dockerhub-tag-link] |

### armel

![ARMv5 Tree Diagram](/img/armel-devices.jpg)



##### TS-7700

| Image | Links | Available Tag |
|:-----------|:------------|:------------|
| resin/ts7700-debian | [dockerhub][armel-ts7700-dockerhub-link], [github][armel-ts7700-github-link] | latest, jessie, wheezy |
| resin/ts7700-buildpack-deps | [dockerhub][armel-ts7700-buildpack-deps-dockerhub-link], [github][armel-ts7700-buildpack-deps-github-link] | latest, jessie, wheezy, jessie-scm, wheezy-scm, jessie-curl, wheezy-curl |
| resin/ts7700-node | [dockerhub][armel-ts7700-node-dockerhub-link], [github][armel-ts7700-node-github-link] | For available image tags, refer [here][armel-ts7700-node-dockerhub-tag-link] |
| resin/ts7700-python | [dockerhub][armel-ts7700-python-dockerhub-link], [github][armel-ts7700-python-github-link] | For available image tags, refer [here][armel-ts7700-python-dockerhub-tag-link] |
| resin/ts7700-golang | [dockerhub][armel-ts7700-golang-dockerhub-link], [github][armel-ts7700-golang-github-link] | For available image tags, refer [here][armel-ts7700-golang-dockerhub-tag-link] |
| resin/ts7700-openjdk | [dockerhub][armel-ts7700-openjdk-dockerhub-link], [github][armel-ts7700-openjdk-github-link] | For available image tags, refer [here][armel-ts7700-openjdk-dockerhub-tag-link] |

#### <a name="tips"></a>Tips

* The `latest` tag points to jessie (Debian), 24 (Fedora) and 3.4 (Alpine Linux).
* For those images with Systemd init system installed (Debian and Fedora based base images), the systemd init system is disabled by default. It can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.
* For those images with OpenRC init system installed (Alpine Linux based base images), the OpenRC init system is disabled by default. It can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger OpenRC init system on the Docker image.
* `systemd was included in Debian wheezy as a technology preview. Please make sure that you are using Debian testing or newer to get a recent version of systemd.` from [Systemd Debian Wiki Page][systemd-wiki]. Therefore, we do not install systemd on wheezy images. `ENV INITSYSTEM` will only work on jessie and sid images.
* In case, you have your own systemd service and you want your systemd service to use the environment variables you set in the dashboard. You need to add `EnvironmentFile=/etc/docker.env` to your systemd service unit file.
* To keep Resin base images fresh, we re-build all base images every week and update version of language specific base images with the latest version in official repository. Sometimes, the newly built base images can accidentally break your build and we don't want that issue happens to our users. Therefore, we introduce the date fixed tag such as `jessie-20160510`, the date fixed tag images will never change so you can use them to have a stable build and never need to worry about broken build. 

## Resin-io-library Images:

### <a name="buildpack-deps"></a>buildpack-deps

A collection of common build dependencies used for installing various modules, e.g., gems. it has 2 variants which are:

* **curl**: This variant includes just the curl, wget, and ca-certificates packages. This is perfect for cases like the Java JRE, where downloading JARs is very common and necessary, but checking out code isn't.
* **scm**: This variant is based on curl, but also adds various source control management tools. As of this writing, the current list of included tools is bzr, git, hg, and svn. Intentionally missing is cvs due to the dwindling relevance it has (sorry CVS). This image is perfect for cases like the Java JDK, where downloading JARs is very common (hence the curl base still), but checking out code also becomes more common as well (compared to the JRE).

| Variant | Base Image | Installed Packages | Available Tag |
|:-----------|:------------|:------------|:------------|
| curl | respective arch based images | ca-certificates, curl, wget | curl, jessie-curl, wheezy-curl, sid-curl (only for armv7) |
| scm | respective curl images | bzr, git, mercurial, openssh-client, subversion | scm, jessie-scm, wheezy-scm, sid-scm (only for armv7) |
| buildpack-deps | respective scm images | autoconf, build-essential, imagemagick, libbz2-dev, libcurl4-openssl-dev, libevent-dev, libffi-dev, libglib2.0-dev, libjpeg-dev, libmagickcore-dev, libmagickwand-dev, libmysqlclient-dev, libncurses-dev, libpq-dev, libreadline-dev, libsqlite3-dev, libssl-dev, libxml2-dev, libxslt-dev, libyaml-dev, zlib1g-dev | latest, jessie, wheezy, sid (only for armv7) |

### <a name="node"></a>docker-node

This is a set of images with node.js binary installed. The node images come in many flavors, each designed for a specific use case.

#### Variants:

* **node:<version>**: This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of. **This tag is based off of buildpack-deps image**. buildpack-deps is designed for the average user of docker who has many images on their system. It, by design, has a large number of extremely common Debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the overall size of all images on your system.
* **node:<version>-onbuild**: This image makes building derivative images easier. For most use cases, creating a Dockerfile in the base of your project directory with the line FROM node:onbuild will be enough to create a stand-alone image for your project.
* **node:<version>-slim**: This image does not contain the common packages contained in the default tag and only contains the minimal packages needed to run node. Unless you are working in an environment where only the node image will be deployed and you have space constraints, we highly recommend using the default image of this repository.

### <a name="python"></a>Python

#### What is Python?

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.
[wikipedia.org/wiki/Python_(programming_language)][python-wiki]

__Note:__ `pip, python-dbus, virtualenv, setuptools` are preinstalled in all python images.

#### Variants:

The `python` images come in many flavors, each designed for a specific use case.

* `python:<version>`

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of. This tag is based off of `buildpack-deps`. `buildpack-deps` is designed for the average user of docker who has many images on their system. It, by design, has a large number of extremely common Debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the overall size of all images on your system.

* `python:<version>-slim`

This image does not contain the common packages contained in the default tag and only contains the minimal packages needed to run python. Unless you are working in an environment where only the python image will be deployed and you have space constraints, we highly recommend using the default image of this repository.

* `python:<version>-onbuild`

This image feeds your `requirements.txt` file automatically to `pip` in order to make building derivative images easier. For most use cases, creating a Dockerfile in the base of your project directory with the line `FROM python:onbuild` will be enough to create a stand-alone image for your project.

While the onbuild variant is really useful for "getting off the ground running" (zero to Dockerized in a short period of time), it's not recommended for long-term usage within a project due to the lack of control over when the ONBUILD triggers fire (see also docker/docker#5714, docker/docker#8240, docker/docker#11917).

Once you've got a handle on how your project functions within Docker, you'll probably want to adjust your Dockerfile to inherit from a non-onbuild variant and copy the commands from the onbuild variant Dockerfile (moving the ONBUILD lines to the end and removing the ONBUILD keywords) into your own file so that you have tighter control over them and more transparency for yourself and others looking at your Dockerfile as to what it does. This also makes it easier to add additional requirements as time goes on (such as installing more packages before performing the previously-ONBUILD steps).

### <a name="golang"></a>Golang

#### What is Go?

Go (a.k.a., Golang) is a programming language first developed at Google. It is a statically-typed language with syntax loosely derived from C, but with additional features such as garbage collection, type safety, some dynamic-typing capabilities, additional built-in types (e.g., variable-length arrays and key-value maps), and a large standard library.
[wikipedia.org/wiki/Go_(programming_language)][golang-wiki]

#### Variants:

The `golang` images come in many flavors, each designed for a specific use case.

* `golang:<version>`

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of. This tag is based off of [buildpack-deps](#buildpack-deps). `buildpack-deps` is designed for the average user of docker who has many images on their system. It, by design, has a large number of extremely common Debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the overall size of all images on your system.

* `golang:<version>-slim`

This image does not contain the common packages contained in the default tag and only contains the minimal packages needed to run Go. Unless you are working in an environment where only the Go image will be deployed and you have space constraints, we highly recommend using the default image of this repository.

#### Notes:

* Default working directory (WORKDIR) and `$GOPATH` is `/go`, Go projects should be copied there. If you want to copy your projects to different place, you need to set `$GOPATH` by yourself.

* ARM Qemu and Go don't work together properly, so we highly recommend our users to build your Go projects on the device (only ARM devices, you do not need to do this for other platforms), not during build time. Otherwise, the build will potentially fail. You can have a script to build and run Go projects and use Docker CMD command to run it.

### <a name="OpenJDK"></a>OpenJDK

#### What is OpenJDK?

OpenJDK (Open Java Development Kit) is a free and open source implementation of the Java Platform, Standard Edition (Java SE). OpenJDK is the official reference implementation of Java SE since version 7.

> [wikipedia.org/wiki/OpenJDK](http://en.wikipedia.org/wiki/OpenJDK)

Java is a registered trademark of Oracle and/or its affiliates.

![logo](https://raw.githubusercontent.com/docker-library/docs/a3439b66b7980d1811f6b3835a3c541747172970/openjdk/logo.png)

#### Notes:

* There are two variants (jdk and jre) for each Java version.

* Debian OpenJDK images support both version 7 and 8 while Alpine Linux OpenJDK images only support version 7 and Fedora OpenJDK images only support version 8.

[base-repository]:https://github.com/resin-io-library/base-images
[base-images-changelog]:https://github.com/resin-io-library/base-images/blob/master/CHANGELOG.md
[rpi-dockerhub-link]:https://registry.hub.docker.com/u/resin/rpi-raspbian/
[armv7hf-dockerhub-link]:https://registry.hub.docker.com/u/resin/armv7hf-debian/
[i386-dockerhub-link]:https://registry.hub.docker.com/u/resin/i386-debian/
[rpi-github-link]:https://github.com/resin-io-library/resin-rpi-raspbian/
[armv7hf-github-link]:https://github.com/resin-io-library/base-images/tree/master/debian/armv7hf
[i386-github-link]:https://github.com/resin-io-library/base-images/tree/master/debian/i386
[amd64-github-link]:https://github.com/resin-io-library/base-images/tree/master/debian/amd64
[amd64-dockerhub-link]:https://registry.hub.docker.com/u/resin/amd64-debian/#
[armel-github-link]:https://github.com/resin-io-library/base-images/tree/master/debian/armel
[armel-dockerhub-link]:https://registry.hub.docker.com/u/resin/armel-debian/
[aarch64-github-link]:https://github.com/resin-io-library/base-images/tree/master/debian/aarch64
[aarch64-dockerhub-link]:https://registry.hub.docker.com/u/resin/aarch64-debian/
[armhf-alpine-github-link]:https://github.com/resin-io-library/base-images/alpine/armhf
[armhf-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/armhf-alpine/
[i386-alpine-github-link]:https://github.com/resin-io-library/base-images/alpine/i386
[i386-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/i386-alpine/
[amd64-alpine-github-link]:https://github.com/resin-io-library/base-images/alpine/amd64
[amd64-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/amd64-alpine/
[armv7hf-fedora-github-link]:https://github.com/resin-io-playground/resin-fedora
[armv7hf-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/armv7hf-fedora/

[systemd-wiki]:https://wiki.debian.org/systemd
[golang-wiki]:https://en.wikipedia.org/wiki/Go_%28programming_language%29
[python-wiki]:https://en.wikipedia.org/wiki/Python_%28programming_language%29



[armv6hf-raspberrypi-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-debian/
[armv6hf-raspberrypi-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-buildpack-deps/
[armv6hf-raspberrypi-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-node/
[armv6hf-raspberrypi-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-node/tags/manage/
[armv6hf-raspberrypi-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-python/
[armv6hf-raspberrypi-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-python/tags/manage/
[armv6hf-raspberrypi-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi
[armv6hf-raspberrypi-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi
[armv6hf-raspberrypi-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi
[armv6hf-raspberrypi-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi
[armv6hf-raspberrypi-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-golang/
[armv6hf-raspberrypi-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-golang/tags/manage/
[armv6hf-raspberrypi-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi
[armv6hf-raspberrypi-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-openjdk/
[armv6hf-raspberrypi-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-openjdk/tags/manage/
[armv6hf-raspberrypi-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi
[armv6hf-raspberrypi-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine/
[armv6hf-raspberrypi-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-buildpack-deps/
[armv6hf-raspberrypi-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-node/
[armv6hf-raspberrypi-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-node/tags/manage/
[armv6hf-raspberrypi-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-python/
[armv6hf-raspberrypi-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-python/tags/manage/
[armv6hf-raspberrypi-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi
[armv6hf-raspberrypi-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi
[armv6hf-raspberrypi-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi
[armv6hf-raspberrypi-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi
[armv6hf-raspberrypi-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-golang/
[armv6hf-raspberrypi-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-golang/tags/manage/
[armv6hf-raspberrypi-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi
[armv6hf-raspberrypi-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-openjdk/
[armv6hf-raspberrypi-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi-alpine-openjdk/tags/manage/
[armv6hf-raspberrypi-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi

[armv7hf-raspberrypi2-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-debian/
[armv7hf-raspberrypi2-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-buildpack-deps/
[armv7hf-raspberrypi2-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-node/
[armv7hf-raspberrypi2-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-node/tags/manage/
[armv7hf-raspberrypi2-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-python/
[armv7hf-raspberrypi2-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-python/tags/manage/
[armv7hf-raspberrypi2-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi2
[armv7hf-raspberrypi2-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi2
[armv7hf-raspberrypi2-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi2
[armv7hf-raspberrypi2-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi2
[armv7hf-raspberrypi2-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-golang/
[armv7hf-raspberrypi2-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-golang/tags/manage/
[armv7hf-raspberrypi2-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi2
[armv7hf-raspberrypi2-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-openjdk/
[armv7hf-raspberrypi2-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-openjdk/tags/manage/
[armv7hf-raspberrypi2-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi2
[armv7hf-raspberrypi2-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine/
[armv7hf-raspberrypi2-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-buildpack-deps/
[armv7hf-raspberrypi2-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-node/
[armv7hf-raspberrypi2-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-node/tags/manage/
[armv7hf-raspberrypi2-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-python/
[armv7hf-raspberrypi2-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-python/tags/manage/
[armv7hf-raspberrypi2-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi2
[armv7hf-raspberrypi2-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi2
[armv7hf-raspberrypi2-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi2
[armv7hf-raspberrypi2-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi2
[armv7hf-raspberrypi2-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-golang/
[armv7hf-raspberrypi2-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-golang/tags/manage/
[armv7hf-raspberrypi2-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi2
[armv7hf-raspberrypi2-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-openjdk/
[armv7hf-raspberrypi2-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-alpine-openjdk/tags/manage/
[armv7hf-raspberrypi2-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi2
[armv7hf-raspberrypi2-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora/
[armv7hf-raspberrypi2-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-buildpack-deps/
[armv7hf-raspberrypi2-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-node/
[armv7hf-raspberrypi2-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-node/tags/manage/
[armv7hf-raspberrypi2-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-python/
[armv7hf-raspberrypi2-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-python/tags/manage/
[armv7hf-raspberrypi2-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi2
[armv7hf-raspberrypi2-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi2
[armv7hf-raspberrypi2-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi2
[armv7hf-raspberrypi2-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi2
[armv7hf-raspberrypi2-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-golang/
[armv7hf-raspberrypi2-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-golang/tags/manage/
[armv7hf-raspberrypi2-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi2
[armv7hf-raspberrypi2-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-openjdk/
[armv7hf-raspberrypi2-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi2-fedora-openjdk/tags/manage/
[armv7hf-raspberrypi2-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi2

[armv7hf-raspberrypi3-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-debian/
[armv7hf-raspberrypi3-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-buildpack-deps/
[armv7hf-raspberrypi3-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-node/
[armv7hf-raspberrypi3-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-node/tags/manage/
[armv7hf-raspberrypi3-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-python/
[armv7hf-raspberrypi3-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-python/tags/manage/
[armv7hf-raspberrypi3-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi3
[armv7hf-raspberrypi3-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi3
[armv7hf-raspberrypi3-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi3
[armv7hf-raspberrypi3-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi3
[armv7hf-raspberrypi3-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-golang/
[armv7hf-raspberrypi3-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-golang/tags/manage/
[armv7hf-raspberrypi3-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi3
[armv7hf-raspberrypi3-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-openjdk/
[armv7hf-raspberrypi3-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-openjdk/tags/manage/
[armv7hf-raspberrypi3-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi3
[armv7hf-raspberrypi3-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine/
[armv7hf-raspberrypi3-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-buildpack-deps/
[armv7hf-raspberrypi3-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-node/
[armv7hf-raspberrypi3-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-node/tags/manage/
[armv7hf-raspberrypi3-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-python/
[armv7hf-raspberrypi3-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-python/tags/manage/
[armv7hf-raspberrypi3-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi3
[armv7hf-raspberrypi3-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi3
[armv7hf-raspberrypi3-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi3
[armv7hf-raspberrypi3-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi3
[armv7hf-raspberrypi3-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-golang/
[armv7hf-raspberrypi3-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-golang/tags/manage/
[armv7hf-raspberrypi3-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi3
[armv7hf-raspberrypi3-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-openjdk/
[armv7hf-raspberrypi3-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-alpine-openjdk/tags/manage/
[armv7hf-raspberrypi3-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi3
[armv7hf-raspberrypi3-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora/
[armv7hf-raspberrypi3-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-buildpack-deps/
[armv7hf-raspberrypi3-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-node/
[armv7hf-raspberrypi3-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-node/tags/manage/
[armv7hf-raspberrypi3-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-python/
[armv7hf-raspberrypi3-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-python/tags/manage/
[armv7hf-raspberrypi3-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/raspberrypi3
[armv7hf-raspberrypi3-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/raspberrypi3
[armv7hf-raspberrypi3-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/raspberrypi3
[armv7hf-raspberrypi3-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/raspberrypi3
[armv7hf-raspberrypi3-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-golang/
[armv7hf-raspberrypi3-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-golang/tags/manage/
[armv7hf-raspberrypi3-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/raspberrypi3
[armv7hf-raspberrypi3-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-openjdk/
[armv7hf-raspberrypi3-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/raspberrypi3-fedora-openjdk/tags/manage/
[armv7hf-raspberrypi3-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/raspberrypi3

[armv7hf-beaglebone-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-debian/
[armv7hf-beaglebone-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-buildpack-deps/
[armv7hf-beaglebone-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-node/
[armv7hf-beaglebone-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-node/tags/manage/
[armv7hf-beaglebone-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-python/
[armv7hf-beaglebone-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-python/tags/manage/
[armv7hf-beaglebone-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone
[armv7hf-beaglebone-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone
[armv7hf-beaglebone-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone
[armv7hf-beaglebone-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone
[armv7hf-beaglebone-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-golang/
[armv7hf-beaglebone-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-golang/tags/manage/
[armv7hf-beaglebone-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone
[armv7hf-beaglebone-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-openjdk/
[armv7hf-beaglebone-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-openjdk/tags/manage/
[armv7hf-beaglebone-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone
[armv7hf-beaglebone-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine/
[armv7hf-beaglebone-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-buildpack-deps/
[armv7hf-beaglebone-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-node/
[armv7hf-beaglebone-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-node/tags/manage/
[armv7hf-beaglebone-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-python/
[armv7hf-beaglebone-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-python/tags/manage/
[armv7hf-beaglebone-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone
[armv7hf-beaglebone-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone
[armv7hf-beaglebone-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone
[armv7hf-beaglebone-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone
[armv7hf-beaglebone-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-golang/
[armv7hf-beaglebone-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-golang/tags/manage/
[armv7hf-beaglebone-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone
[armv7hf-beaglebone-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-openjdk/
[armv7hf-beaglebone-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-alpine-openjdk/tags/manage/
[armv7hf-beaglebone-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone
[armv7hf-beaglebone-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora/
[armv7hf-beaglebone-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-buildpack-deps/
[armv7hf-beaglebone-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-node/
[armv7hf-beaglebone-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-node/tags/manage/
[armv7hf-beaglebone-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-python/
[armv7hf-beaglebone-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-python/tags/manage/
[armv7hf-beaglebone-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone
[armv7hf-beaglebone-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone
[armv7hf-beaglebone-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone
[armv7hf-beaglebone-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone
[armv7hf-beaglebone-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-golang/
[armv7hf-beaglebone-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-golang/tags/manage/
[armv7hf-beaglebone-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone
[armv7hf-beaglebone-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-openjdk/
[armv7hf-beaglebone-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-fedora-openjdk/tags/manage/
[armv7hf-beaglebone-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone

[armv7hf-beaglebone-green-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-debian/
[armv7hf-beaglebone-green-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-buildpack-deps/
[armv7hf-beaglebone-green-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-node/
[armv7hf-beaglebone-green-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-node/tags/manage/
[armv7hf-beaglebone-green-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-python/
[armv7hf-beaglebone-green-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-python/tags/manage/
[armv7hf-beaglebone-green-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone-green
[armv7hf-beaglebone-green-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone-green
[armv7hf-beaglebone-green-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone-green
[armv7hf-beaglebone-green-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone-green
[armv7hf-beaglebone-green-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-golang/
[armv7hf-beaglebone-green-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-golang/tags/manage/
[armv7hf-beaglebone-green-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone-green
[armv7hf-beaglebone-green-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-openjdk/
[armv7hf-beaglebone-green-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-openjdk/tags/manage/
[armv7hf-beaglebone-green-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone-green
[armv7hf-beaglebone-green-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine/
[armv7hf-beaglebone-green-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-buildpack-deps/
[armv7hf-beaglebone-green-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-node/
[armv7hf-beaglebone-green-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-node/tags/manage/
[armv7hf-beaglebone-green-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-python/
[armv7hf-beaglebone-green-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-python/tags/manage/
[armv7hf-beaglebone-green-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone-green
[armv7hf-beaglebone-green-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone-green
[armv7hf-beaglebone-green-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone-green
[armv7hf-beaglebone-green-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone-green
[armv7hf-beaglebone-green-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-golang/
[armv7hf-beaglebone-green-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-golang/tags/manage/
[armv7hf-beaglebone-green-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone-green
[armv7hf-beaglebone-green-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-openjdk/
[armv7hf-beaglebone-green-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-alpine-openjdk/tags/manage/
[armv7hf-beaglebone-green-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone-green
[armv7hf-beaglebone-green-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora/
[armv7hf-beaglebone-green-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-buildpack-deps/
[armv7hf-beaglebone-green-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-node/
[armv7hf-beaglebone-green-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-node/tags/manage/
[armv7hf-beaglebone-green-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-python/
[armv7hf-beaglebone-green-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-python/tags/manage/
[armv7hf-beaglebone-green-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone-green
[armv7hf-beaglebone-green-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone-green
[armv7hf-beaglebone-green-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone-green
[armv7hf-beaglebone-green-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone-green
[armv7hf-beaglebone-green-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-golang/
[armv7hf-beaglebone-green-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-golang/tags/manage/
[armv7hf-beaglebone-green-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone-green
[armv7hf-beaglebone-green-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-openjdk/
[armv7hf-beaglebone-green-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-fedora-openjdk/tags/manage/
[armv7hf-beaglebone-green-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone-green

[armv7hf-beaglebone-green-wifi-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-debian/
[armv7hf-beaglebone-green-wifi-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-buildpack-deps/
[armv7hf-beaglebone-green-wifi-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-node/
[armv7hf-beaglebone-green-wifi-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-node/tags/manage/
[armv7hf-beaglebone-green-wifi-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-python/
[armv7hf-beaglebone-green-wifi-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-python/tags/manage/
[armv7hf-beaglebone-green-wifi-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-golang/
[armv7hf-beaglebone-green-wifi-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-golang/tags/manage/
[armv7hf-beaglebone-green-wifi-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-openjdk/
[armv7hf-beaglebone-green-wifi-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-openjdk/tags/manage/
[armv7hf-beaglebone-green-wifi-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine/
[armv7hf-beaglebone-green-wifi-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-buildpack-deps/
[armv7hf-beaglebone-green-wifi-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-node/
[armv7hf-beaglebone-green-wifi-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-node/tags/manage/
[armv7hf-beaglebone-green-wifi-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-python/
[armv7hf-beaglebone-green-wifi-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-python/tags/manage/
[armv7hf-beaglebone-green-wifi-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-golang/
[armv7hf-beaglebone-green-wifi-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-golang/tags/manage/
[armv7hf-beaglebone-green-wifi-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-openjdk/
[armv7hf-beaglebone-green-wifi-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-alpine-openjdk/tags/manage/
[armv7hf-beaglebone-green-wifi-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora/
[armv7hf-beaglebone-green-wifi-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-buildpack-deps/
[armv7hf-beaglebone-green-wifi-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-node/
[armv7hf-beaglebone-green-wifi-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-node/tags/manage/
[armv7hf-beaglebone-green-wifi-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-python/
[armv7hf-beaglebone-green-wifi-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-python/tags/manage/
[armv7hf-beaglebone-green-wifi-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-golang/
[armv7hf-beaglebone-green-wifi-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-golang/tags/manage/
[armv7hf-beaglebone-green-wifi-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/beaglebone-green-wifi
[armv7hf-beaglebone-green-wifi-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-openjdk/
[armv7hf-beaglebone-green-wifi-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/beaglebone-green-wifi-fedora-openjdk/tags/manage/
[armv7hf-beaglebone-green-wifi-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/beaglebone-green-wifi

[armv7hf-vab820-quad-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-debian/
[armv7hf-vab820-quad-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-buildpack-deps/
[armv7hf-vab820-quad-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-node/
[armv7hf-vab820-quad-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-node/tags/manage/
[armv7hf-vab820-quad-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-python/
[armv7hf-vab820-quad-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-python/tags/manage/
[armv7hf-vab820-quad-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/vab820-quad
[armv7hf-vab820-quad-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/vab820-quad
[armv7hf-vab820-quad-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/vab820-quad
[armv7hf-vab820-quad-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/vab820-quad
[armv7hf-vab820-quad-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-golang/
[armv7hf-vab820-quad-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-golang/tags/manage/
[armv7hf-vab820-quad-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/vab820-quad
[armv7hf-vab820-quad-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-openjdk/
[armv7hf-vab820-quad-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-openjdk/tags/manage/
[armv7hf-vab820-quad-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/vab820-quad
[armv7hf-vab820-quad-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine/
[armv7hf-vab820-quad-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-buildpack-deps/
[armv7hf-vab820-quad-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-node/
[armv7hf-vab820-quad-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-node/tags/manage/
[armv7hf-vab820-quad-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-python/
[armv7hf-vab820-quad-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-python/tags/manage/
[armv7hf-vab820-quad-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/vab820-quad
[armv7hf-vab820-quad-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/vab820-quad
[armv7hf-vab820-quad-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/vab820-quad
[armv7hf-vab820-quad-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/vab820-quad
[armv7hf-vab820-quad-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-golang/
[armv7hf-vab820-quad-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-golang/tags/manage/
[armv7hf-vab820-quad-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/vab820-quad
[armv7hf-vab820-quad-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-openjdk/
[armv7hf-vab820-quad-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-alpine-openjdk/tags/manage/
[armv7hf-vab820-quad-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/vab820-quad
[armv7hf-vab820-quad-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora/
[armv7hf-vab820-quad-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-buildpack-deps/
[armv7hf-vab820-quad-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-node/
[armv7hf-vab820-quad-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-node/tags/manage/
[armv7hf-vab820-quad-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-python/
[armv7hf-vab820-quad-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-python/tags/manage/
[armv7hf-vab820-quad-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/vab820-quad
[armv7hf-vab820-quad-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/vab820-quad
[armv7hf-vab820-quad-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/vab820-quad
[armv7hf-vab820-quad-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/vab820-quad
[armv7hf-vab820-quad-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-golang/
[armv7hf-vab820-quad-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-golang/tags/manage/
[armv7hf-vab820-quad-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/vab820-quad
[armv7hf-vab820-quad-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-openjdk/
[armv7hf-vab820-quad-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/vab820-quad-fedora-openjdk/tags/manage/
[armv7hf-vab820-quad-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/vab820-quad

[armv7hf-zc702-zynq7-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-debian/
[armv7hf-zc702-zynq7-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-buildpack-deps/
[armv7hf-zc702-zynq7-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-node/
[armv7hf-zc702-zynq7-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-node/tags/manage/
[armv7hf-zc702-zynq7-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-python/
[armv7hf-zc702-zynq7-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-python/tags/manage/
[armv7hf-zc702-zynq7-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/zc702-zynq7
[armv7hf-zc702-zynq7-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/zc702-zynq7
[armv7hf-zc702-zynq7-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/zc702-zynq7
[armv7hf-zc702-zynq7-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/zc702-zynq7
[armv7hf-zc702-zynq7-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-golang/
[armv7hf-zc702-zynq7-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-golang/tags/manage/
[armv7hf-zc702-zynq7-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/zc702-zynq7
[armv7hf-zc702-zynq7-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-openjdk/
[armv7hf-zc702-zynq7-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-openjdk/tags/manage/
[armv7hf-zc702-zynq7-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/zc702-zynq7
[armv7hf-zc702-zynq7-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine/
[armv7hf-zc702-zynq7-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-buildpack-deps/
[armv7hf-zc702-zynq7-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-node/
[armv7hf-zc702-zynq7-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-node/tags/manage/
[armv7hf-zc702-zynq7-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-python/
[armv7hf-zc702-zynq7-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-python/tags/manage/
[armv7hf-zc702-zynq7-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/zc702-zynq7
[armv7hf-zc702-zynq7-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/zc702-zynq7
[armv7hf-zc702-zynq7-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/zc702-zynq7
[armv7hf-zc702-zynq7-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/zc702-zynq7
[armv7hf-zc702-zynq7-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-golang/
[armv7hf-zc702-zynq7-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-golang/tags/manage/
[armv7hf-zc702-zynq7-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/zc702-zynq7
[armv7hf-zc702-zynq7-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-openjdk/
[armv7hf-zc702-zynq7-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-alpine-openjdk/tags/manage/
[armv7hf-zc702-zynq7-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/zc702-zynq7
[armv7hf-zc702-zynq7-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora/
[armv7hf-zc702-zynq7-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-buildpack-deps/
[armv7hf-zc702-zynq7-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-node/
[armv7hf-zc702-zynq7-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-node/tags/manage/
[armv7hf-zc702-zynq7-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-python/
[armv7hf-zc702-zynq7-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-python/tags/manage/
[armv7hf-zc702-zynq7-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/zc702-zynq7
[armv7hf-zc702-zynq7-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/zc702-zynq7
[armv7hf-zc702-zynq7-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/zc702-zynq7
[armv7hf-zc702-zynq7-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/zc702-zynq7
[armv7hf-zc702-zynq7-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-golang/
[armv7hf-zc702-zynq7-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-golang/tags/manage/
[armv7hf-zc702-zynq7-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/zc702-zynq7
[armv7hf-zc702-zynq7-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-openjdk/
[armv7hf-zc702-zynq7-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/zc702-zynq7-fedora-openjdk/tags/manage/
[armv7hf-zc702-zynq7-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/zc702-zynq7

[armv7hf-odroid-c1-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-debian/
[armv7hf-odroid-c1-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-buildpack-deps/
[armv7hf-odroid-c1-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-node/
[armv7hf-odroid-c1-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-node/tags/manage/
[armv7hf-odroid-c1-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-python/
[armv7hf-odroid-c1-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-python/tags/manage/
[armv7hf-odroid-c1-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/odroid-c1
[armv7hf-odroid-c1-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/odroid-c1
[armv7hf-odroid-c1-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/odroid-c1
[armv7hf-odroid-c1-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/odroid-c1
[armv7hf-odroid-c1-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-golang/
[armv7hf-odroid-c1-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-golang/tags/manage/
[armv7hf-odroid-c1-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/odroid-c1
[armv7hf-odroid-c1-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-openjdk/
[armv7hf-odroid-c1-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-openjdk/tags/manage/
[armv7hf-odroid-c1-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/odroid-c1
[armv7hf-odroid-c1-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine/
[armv7hf-odroid-c1-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-buildpack-deps/
[armv7hf-odroid-c1-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-node/
[armv7hf-odroid-c1-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-node/tags/manage/
[armv7hf-odroid-c1-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-python/
[armv7hf-odroid-c1-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-python/tags/manage/
[armv7hf-odroid-c1-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/odroid-c1
[armv7hf-odroid-c1-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/odroid-c1
[armv7hf-odroid-c1-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/odroid-c1
[armv7hf-odroid-c1-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/odroid-c1
[armv7hf-odroid-c1-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-golang/
[armv7hf-odroid-c1-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-golang/tags/manage/
[armv7hf-odroid-c1-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/odroid-c1
[armv7hf-odroid-c1-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-openjdk/
[armv7hf-odroid-c1-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-alpine-openjdk/tags/manage/
[armv7hf-odroid-c1-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/odroid-c1
[armv7hf-odroid-c1-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora/
[armv7hf-odroid-c1-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-buildpack-deps/
[armv7hf-odroid-c1-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-node/
[armv7hf-odroid-c1-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-node/tags/manage/
[armv7hf-odroid-c1-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-python/
[armv7hf-odroid-c1-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-python/tags/manage/
[armv7hf-odroid-c1-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/odroid-c1
[armv7hf-odroid-c1-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/odroid-c1
[armv7hf-odroid-c1-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/odroid-c1
[armv7hf-odroid-c1-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/odroid-c1
[armv7hf-odroid-c1-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-golang/
[armv7hf-odroid-c1-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-golang/tags/manage/
[armv7hf-odroid-c1-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/odroid-c1
[armv7hf-odroid-c1-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-openjdk/
[armv7hf-odroid-c1-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-c1-fedora-openjdk/tags/manage/
[armv7hf-odroid-c1-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/odroid-c1

[armv7hf-odroid-ux3-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-debian/
[armv7hf-odroid-ux3-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-buildpack-deps/
[armv7hf-odroid-ux3-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-node/
[armv7hf-odroid-ux3-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-node/tags/manage/
[armv7hf-odroid-ux3-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-python/
[armv7hf-odroid-ux3-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-python/tags/manage/
[armv7hf-odroid-ux3-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/odroid-ux3
[armv7hf-odroid-ux3-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/odroid-ux3
[armv7hf-odroid-ux3-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/odroid-ux3
[armv7hf-odroid-ux3-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/odroid-ux3
[armv7hf-odroid-ux3-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-golang/
[armv7hf-odroid-ux3-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-golang/tags/manage/
[armv7hf-odroid-ux3-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/odroid-ux3
[armv7hf-odroid-ux3-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-openjdk/
[armv7hf-odroid-ux3-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-openjdk/tags/manage/
[armv7hf-odroid-ux3-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/odroid-ux3
[armv7hf-odroid-ux3-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine/
[armv7hf-odroid-ux3-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-buildpack-deps/
[armv7hf-odroid-ux3-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-node/
[armv7hf-odroid-ux3-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-node/tags/manage/
[armv7hf-odroid-ux3-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-python/
[armv7hf-odroid-ux3-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-python/tags/manage/
[armv7hf-odroid-ux3-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/odroid-ux3
[armv7hf-odroid-ux3-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/odroid-ux3
[armv7hf-odroid-ux3-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/odroid-ux3
[armv7hf-odroid-ux3-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/odroid-ux3
[armv7hf-odroid-ux3-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-golang/
[armv7hf-odroid-ux3-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-golang/tags/manage/
[armv7hf-odroid-ux3-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/odroid-ux3
[armv7hf-odroid-ux3-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-openjdk/
[armv7hf-odroid-ux3-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-alpine-openjdk/tags/manage/
[armv7hf-odroid-ux3-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/odroid-ux3
[armv7hf-odroid-ux3-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora/
[armv7hf-odroid-ux3-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-buildpack-deps/
[armv7hf-odroid-ux3-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-node/
[armv7hf-odroid-ux3-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-node/tags/manage/
[armv7hf-odroid-ux3-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-python/
[armv7hf-odroid-ux3-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-python/tags/manage/
[armv7hf-odroid-ux3-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/odroid-ux3
[armv7hf-odroid-ux3-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/odroid-ux3
[armv7hf-odroid-ux3-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/odroid-ux3
[armv7hf-odroid-ux3-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/odroid-ux3
[armv7hf-odroid-ux3-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-golang/
[armv7hf-odroid-ux3-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-golang/tags/manage/
[armv7hf-odroid-ux3-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/odroid-ux3
[armv7hf-odroid-ux3-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-openjdk/
[armv7hf-odroid-ux3-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/odroid-ux3-fedora-openjdk/tags/manage/
[armv7hf-odroid-ux3-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/odroid-ux3

[armv7hf-parallella-hdmi-resin-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-debian/
[armv7hf-parallella-hdmi-resin-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-buildpack-deps/
[armv7hf-parallella-hdmi-resin-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-node/
[armv7hf-parallella-hdmi-resin-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-node/tags/manage/
[armv7hf-parallella-hdmi-resin-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-python/
[armv7hf-parallella-hdmi-resin-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-python/tags/manage/
[armv7hf-parallella-hdmi-resin-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-golang/
[armv7hf-parallella-hdmi-resin-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-golang/tags/manage/
[armv7hf-parallella-hdmi-resin-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-openjdk/
[armv7hf-parallella-hdmi-resin-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-openjdk/tags/manage/
[armv7hf-parallella-hdmi-resin-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine/
[armv7hf-parallella-hdmi-resin-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-buildpack-deps/
[armv7hf-parallella-hdmi-resin-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-node/
[armv7hf-parallella-hdmi-resin-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-node/tags/manage/
[armv7hf-parallella-hdmi-resin-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-python/
[armv7hf-parallella-hdmi-resin-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-python/tags/manage/
[armv7hf-parallella-hdmi-resin-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-golang/
[armv7hf-parallella-hdmi-resin-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-golang/tags/manage/
[armv7hf-parallella-hdmi-resin-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-openjdk/
[armv7hf-parallella-hdmi-resin-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-alpine-openjdk/tags/manage/
[armv7hf-parallella-hdmi-resin-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora/
[armv7hf-parallella-hdmi-resin-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-buildpack-deps/
[armv7hf-parallella-hdmi-resin-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-node/
[armv7hf-parallella-hdmi-resin-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-node/tags/manage/
[armv7hf-parallella-hdmi-resin-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-python/
[armv7hf-parallella-hdmi-resin-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-python/tags/manage/
[armv7hf-parallella-hdmi-resin-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-golang/
[armv7hf-parallella-hdmi-resin-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-golang/tags/manage/
[armv7hf-parallella-hdmi-resin-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/parallella-hdmi-resin
[armv7hf-parallella-hdmi-resin-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-openjdk/
[armv7hf-parallella-hdmi-resin-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/parallella-hdmi-resin-fedora-openjdk/tags/manage/
[armv7hf-parallella-hdmi-resin-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/parallella-hdmi-resin

[armv7hf-nitrogen6x-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-debian/
[armv7hf-nitrogen6x-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-buildpack-deps/
[armv7hf-nitrogen6x-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-node/
[armv7hf-nitrogen6x-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-node/tags/manage/
[armv7hf-nitrogen6x-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-python/
[armv7hf-nitrogen6x-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-python/tags/manage/
[armv7hf-nitrogen6x-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/nitrogen6x
[armv7hf-nitrogen6x-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/nitrogen6x
[armv7hf-nitrogen6x-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/nitrogen6x
[armv7hf-nitrogen6x-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/nitrogen6x
[armv7hf-nitrogen6x-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-golang/
[armv7hf-nitrogen6x-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-golang/tags/manage/
[armv7hf-nitrogen6x-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/nitrogen6x
[armv7hf-nitrogen6x-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-openjdk/
[armv7hf-nitrogen6x-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-openjdk/tags/manage/
[armv7hf-nitrogen6x-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/nitrogen6x
[armv7hf-nitrogen6x-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine/
[armv7hf-nitrogen6x-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-buildpack-deps/
[armv7hf-nitrogen6x-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-node/
[armv7hf-nitrogen6x-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-node/tags/manage/
[armv7hf-nitrogen6x-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-python/
[armv7hf-nitrogen6x-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-python/tags/manage/
[armv7hf-nitrogen6x-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/nitrogen6x
[armv7hf-nitrogen6x-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/nitrogen6x
[armv7hf-nitrogen6x-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/nitrogen6x
[armv7hf-nitrogen6x-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/nitrogen6x
[armv7hf-nitrogen6x-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-golang/
[armv7hf-nitrogen6x-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-golang/tags/manage/
[armv7hf-nitrogen6x-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/nitrogen6x
[armv7hf-nitrogen6x-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-openjdk/
[armv7hf-nitrogen6x-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-alpine-openjdk/tags/manage/
[armv7hf-nitrogen6x-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/nitrogen6x
[armv7hf-nitrogen6x-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora/
[armv7hf-nitrogen6x-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-buildpack-deps/
[armv7hf-nitrogen6x-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-node/
[armv7hf-nitrogen6x-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-node/tags/manage/
[armv7hf-nitrogen6x-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-python/
[armv7hf-nitrogen6x-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-python/tags/manage/
[armv7hf-nitrogen6x-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/nitrogen6x
[armv7hf-nitrogen6x-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/nitrogen6x
[armv7hf-nitrogen6x-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/nitrogen6x
[armv7hf-nitrogen6x-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/nitrogen6x
[armv7hf-nitrogen6x-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-golang/
[armv7hf-nitrogen6x-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-golang/tags/manage/
[armv7hf-nitrogen6x-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/nitrogen6x
[armv7hf-nitrogen6x-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-openjdk/
[armv7hf-nitrogen6x-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nitrogen6x-fedora-openjdk/tags/manage/
[armv7hf-nitrogen6x-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/nitrogen6x

[armv7hf-cubox-i-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-debian/
[armv7hf-cubox-i-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-buildpack-deps/
[armv7hf-cubox-i-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-node/
[armv7hf-cubox-i-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-node/tags/manage/
[armv7hf-cubox-i-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-python/
[armv7hf-cubox-i-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-python/tags/manage/
[armv7hf-cubox-i-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/cubox-i
[armv7hf-cubox-i-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/cubox-i
[armv7hf-cubox-i-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/cubox-i
[armv7hf-cubox-i-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/cubox-i
[armv7hf-cubox-i-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-golang/
[armv7hf-cubox-i-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-golang/tags/manage/
[armv7hf-cubox-i-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/cubox-i
[armv7hf-cubox-i-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-openjdk/
[armv7hf-cubox-i-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-openjdk/tags/manage/
[armv7hf-cubox-i-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/cubox-i
[armv7hf-cubox-i-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine/
[armv7hf-cubox-i-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-buildpack-deps/
[armv7hf-cubox-i-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-node/
[armv7hf-cubox-i-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-node/tags/manage/
[armv7hf-cubox-i-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-python/
[armv7hf-cubox-i-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-python/tags/manage/
[armv7hf-cubox-i-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/cubox-i
[armv7hf-cubox-i-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/cubox-i
[armv7hf-cubox-i-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/cubox-i
[armv7hf-cubox-i-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/cubox-i
[armv7hf-cubox-i-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-golang/
[armv7hf-cubox-i-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-golang/tags/manage/
[armv7hf-cubox-i-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/cubox-i
[armv7hf-cubox-i-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-openjdk/
[armv7hf-cubox-i-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-alpine-openjdk/tags/manage/
[armv7hf-cubox-i-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/cubox-i
[armv7hf-cubox-i-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora/
[armv7hf-cubox-i-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-buildpack-deps/
[armv7hf-cubox-i-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-node/
[armv7hf-cubox-i-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-node/tags/manage/
[armv7hf-cubox-i-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-python/
[armv7hf-cubox-i-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-python/tags/manage/
[armv7hf-cubox-i-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/cubox-i
[armv7hf-cubox-i-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/cubox-i
[armv7hf-cubox-i-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/cubox-i
[armv7hf-cubox-i-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/cubox-i
[armv7hf-cubox-i-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-golang/
[armv7hf-cubox-i-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-golang/tags/manage/
[armv7hf-cubox-i-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/cubox-i
[armv7hf-cubox-i-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-openjdk/
[armv7hf-cubox-i-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/cubox-i-fedora-openjdk/tags/manage/
[armv7hf-cubox-i-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/cubox-i

[armv7hf-colibri-imx6-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-debian/
[armv7hf-colibri-imx6-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-buildpack-deps/
[armv7hf-colibri-imx6-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-node/
[armv7hf-colibri-imx6-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-node/tags/manage/
[armv7hf-colibri-imx6-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-python/
[armv7hf-colibri-imx6-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-python/tags/manage/
[armv7hf-colibri-imx6-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/colibri-imx6
[armv7hf-colibri-imx6-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/colibri-imx6
[armv7hf-colibri-imx6-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/colibri-imx6
[armv7hf-colibri-imx6-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/colibri-imx6
[armv7hf-colibri-imx6-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-golang/
[armv7hf-colibri-imx6-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-golang/tags/manage/
[armv7hf-colibri-imx6-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/colibri-imx6
[armv7hf-colibri-imx6-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-openjdk/
[armv7hf-colibri-imx6-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-openjdk/tags/manage/
[armv7hf-colibri-imx6-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/colibri-imx6
[armv7hf-colibri-imx6-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine/
[armv7hf-colibri-imx6-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-buildpack-deps/
[armv7hf-colibri-imx6-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-node/
[armv7hf-colibri-imx6-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-node/tags/manage/
[armv7hf-colibri-imx6-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-python/
[armv7hf-colibri-imx6-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-python/tags/manage/
[armv7hf-colibri-imx6-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/colibri-imx6
[armv7hf-colibri-imx6-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/colibri-imx6
[armv7hf-colibri-imx6-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/colibri-imx6
[armv7hf-colibri-imx6-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/colibri-imx6
[armv7hf-colibri-imx6-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-golang/
[armv7hf-colibri-imx6-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-golang/tags/manage/
[armv7hf-colibri-imx6-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/colibri-imx6
[armv7hf-colibri-imx6-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-openjdk/
[armv7hf-colibri-imx6-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-alpine-openjdk/tags/manage/
[armv7hf-colibri-imx6-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/colibri-imx6
[armv7hf-colibri-imx6-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora/
[armv7hf-colibri-imx6-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-buildpack-deps/
[armv7hf-colibri-imx6-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-node/
[armv7hf-colibri-imx6-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-node/tags/manage/
[armv7hf-colibri-imx6-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-python/
[armv7hf-colibri-imx6-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-python/tags/manage/
[armv7hf-colibri-imx6-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/colibri-imx6
[armv7hf-colibri-imx6-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/colibri-imx6
[armv7hf-colibri-imx6-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/colibri-imx6
[armv7hf-colibri-imx6-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/colibri-imx6
[armv7hf-colibri-imx6-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-golang/
[armv7hf-colibri-imx6-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-golang/tags/manage/
[armv7hf-colibri-imx6-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/colibri-imx6
[armv7hf-colibri-imx6-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-openjdk/
[armv7hf-colibri-imx6-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/colibri-imx6-fedora-openjdk/tags/manage/
[armv7hf-colibri-imx6-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/colibri-imx6

[armv7hf-apalis-imx6-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-debian/
[armv7hf-apalis-imx6-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-buildpack-deps/
[armv7hf-apalis-imx6-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-node/
[armv7hf-apalis-imx6-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-node/tags/manage/
[armv7hf-apalis-imx6-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-python/
[armv7hf-apalis-imx6-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-python/tags/manage/
[armv7hf-apalis-imx6-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/apalis-imx6
[armv7hf-apalis-imx6-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/apalis-imx6
[armv7hf-apalis-imx6-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/apalis-imx6
[armv7hf-apalis-imx6-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/apalis-imx6
[armv7hf-apalis-imx6-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-golang/
[armv7hf-apalis-imx6-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-golang/tags/manage/
[armv7hf-apalis-imx6-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/apalis-imx6
[armv7hf-apalis-imx6-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-openjdk/
[armv7hf-apalis-imx6-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-openjdk/tags/manage/
[armv7hf-apalis-imx6-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/apalis-imx6
[armv7hf-apalis-imx6-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine/
[armv7hf-apalis-imx6-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-buildpack-deps/
[armv7hf-apalis-imx6-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-node/
[armv7hf-apalis-imx6-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-node/tags/manage/
[armv7hf-apalis-imx6-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-python/
[armv7hf-apalis-imx6-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-python/tags/manage/
[armv7hf-apalis-imx6-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/apalis-imx6
[armv7hf-apalis-imx6-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/apalis-imx6
[armv7hf-apalis-imx6-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/apalis-imx6
[armv7hf-apalis-imx6-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/apalis-imx6
[armv7hf-apalis-imx6-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-golang/
[armv7hf-apalis-imx6-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-golang/tags/manage/
[armv7hf-apalis-imx6-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/apalis-imx6
[armv7hf-apalis-imx6-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-openjdk/
[armv7hf-apalis-imx6-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-alpine-openjdk/tags/manage/
[armv7hf-apalis-imx6-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/apalis-imx6
[armv7hf-apalis-imx6-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora/
[armv7hf-apalis-imx6-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-buildpack-deps/
[armv7hf-apalis-imx6-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-node/
[armv7hf-apalis-imx6-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-node/tags/manage/
[armv7hf-apalis-imx6-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-python/
[armv7hf-apalis-imx6-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-python/tags/manage/
[armv7hf-apalis-imx6-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/apalis-imx6
[armv7hf-apalis-imx6-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/apalis-imx6
[armv7hf-apalis-imx6-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/apalis-imx6
[armv7hf-apalis-imx6-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/apalis-imx6
[armv7hf-apalis-imx6-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-golang/
[armv7hf-apalis-imx6-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-golang/tags/manage/
[armv7hf-apalis-imx6-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/apalis-imx6
[armv7hf-apalis-imx6-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-openjdk/
[armv7hf-apalis-imx6-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/apalis-imx6-fedora-openjdk/tags/manage/
[armv7hf-apalis-imx6-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/apalis-imx6

[i386-edison-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-debian/
[i386-edison-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-buildpack-deps/
[i386-edison-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-node/
[i386-edison-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-node/tags/manage/
[i386-edison-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-python/
[i386-edison-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-python/tags/manage/
[i386-edison-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/edison
[i386-edison-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/edison
[i386-edison-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/edison
[i386-edison-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/edison
[i386-edison-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-golang/
[i386-edison-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-golang/tags/manage/
[i386-edison-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/edison
[i386-edison-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-openjdk/
[i386-edison-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-openjdk/tags/manage/
[i386-edison-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/edison
[i386-edison-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-alpine/
[i386-edison-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-alpine-buildpack-deps/
[i386-edison-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-alpine-node/
[i386-edison-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-alpine-node/tags/manage/
[i386-edison-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-alpine-python/
[i386-edison-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-alpine-python/tags/manage/
[i386-edison-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/edison
[i386-edison-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/edison
[i386-edison-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/edison
[i386-edison-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/edison
[i386-edison-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-alpine-golang/
[i386-edison-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-alpine-golang/tags/manage/
[i386-edison-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/edison
[i386-edison-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/edison-alpine-openjdk/
[i386-edison-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/edison-alpine-openjdk/tags/manage/
[i386-edison-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/edison

[i386-qemux86-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-debian/
[i386-qemux86-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-buildpack-deps/
[i386-qemux86-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-node/
[i386-qemux86-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-node/tags/manage/
[i386-qemux86-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-python/
[i386-qemux86-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-python/tags/manage/
[i386-qemux86-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/qemux86
[i386-qemux86-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/qemux86
[i386-qemux86-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/qemux86
[i386-qemux86-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/qemux86
[i386-qemux86-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-golang/
[i386-qemux86-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-golang/tags/manage/
[i386-qemux86-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/qemux86
[i386-qemux86-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-openjdk/
[i386-qemux86-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-openjdk/tags/manage/
[i386-qemux86-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/qemux86
[i386-qemux86-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine/
[i386-qemux86-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-buildpack-deps/
[i386-qemux86-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-node/
[i386-qemux86-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-node/tags/manage/
[i386-qemux86-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-python/
[i386-qemux86-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-python/tags/manage/
[i386-qemux86-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/qemux86
[i386-qemux86-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/qemux86
[i386-qemux86-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/qemux86
[i386-qemux86-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/qemux86
[i386-qemux86-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-golang/
[i386-qemux86-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-golang/tags/manage/
[i386-qemux86-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/qemux86
[i386-qemux86-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-openjdk/
[i386-qemux86-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-alpine-openjdk/tags/manage/
[i386-qemux86-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/qemux86

[amd64-nuc-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-debian/
[amd64-nuc-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-buildpack-deps/
[amd64-nuc-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-node/
[amd64-nuc-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-node/tags/manage/
[amd64-nuc-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-python/
[amd64-nuc-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-python/tags/manage/
[amd64-nuc-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/nuc
[amd64-nuc-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/nuc
[amd64-nuc-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/nuc
[amd64-nuc-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/nuc
[amd64-nuc-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-golang/
[amd64-nuc-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-golang/tags/manage/
[amd64-nuc-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/nuc
[amd64-nuc-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-openjdk/
[amd64-nuc-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-openjdk/tags/manage/
[amd64-nuc-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/nuc
[amd64-nuc-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-alpine/
[amd64-nuc-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-buildpack-deps/
[amd64-nuc-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-node/
[amd64-nuc-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-node/tags/manage/
[amd64-nuc-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-python/
[amd64-nuc-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-python/tags/manage/
[amd64-nuc-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/nuc
[amd64-nuc-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/nuc
[amd64-nuc-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/nuc
[amd64-nuc-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/nuc
[amd64-nuc-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-golang/
[amd64-nuc-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-golang/tags/manage/
[amd64-nuc-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/nuc
[amd64-nuc-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-openjdk/
[amd64-nuc-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-alpine-openjdk/tags/manage/
[amd64-nuc-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/nuc
[amd64-nuc-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-fedora/
[amd64-nuc-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-buildpack-deps/
[amd64-nuc-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-node/
[amd64-nuc-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-node/tags/manage/
[amd64-nuc-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-python/
[amd64-nuc-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-python/tags/manage/
[amd64-nuc-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/nuc
[amd64-nuc-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/nuc
[amd64-nuc-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/nuc
[amd64-nuc-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/nuc
[amd64-nuc-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-golang/
[amd64-nuc-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-golang/tags/manage/
[amd64-nuc-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/nuc
[amd64-nuc-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-openjdk/
[amd64-nuc-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/nuc-fedora-openjdk/tags/manage/
[amd64-nuc-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/nuc

[amd64-qemux86-64-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-debian/
[amd64-qemux86-64-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-buildpack-deps/
[amd64-qemux86-64-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-node/
[amd64-qemux86-64-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-node/tags/manage/
[amd64-qemux86-64-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-python/
[amd64-qemux86-64-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-python/tags/manage/
[amd64-qemux86-64-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/qemux86-64
[amd64-qemux86-64-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/qemux86-64
[amd64-qemux86-64-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/qemux86-64
[amd64-qemux86-64-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/qemux86-64
[amd64-qemux86-64-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-golang/
[amd64-qemux86-64-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-golang/tags/manage/
[amd64-qemux86-64-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/qemux86-64
[amd64-qemux86-64-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-openjdk/
[amd64-qemux86-64-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-openjdk/tags/manage/
[amd64-qemux86-64-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/qemux86-64
[amd64-qemux86-64-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine/
[amd64-qemux86-64-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-buildpack-deps/
[amd64-qemux86-64-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-node/
[amd64-qemux86-64-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-node/tags/manage/
[amd64-qemux86-64-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-python/
[amd64-qemux86-64-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-python/tags/manage/
[amd64-qemux86-64-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/qemux86-64
[amd64-qemux86-64-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/qemux86-64
[amd64-qemux86-64-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/qemux86-64
[amd64-qemux86-64-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/qemux86-64
[amd64-qemux86-64-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-golang/
[amd64-qemux86-64-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-golang/tags/manage/
[amd64-qemux86-64-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/qemux86-64
[amd64-qemux86-64-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-openjdk/
[amd64-qemux86-64-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-alpine-openjdk/tags/manage/
[amd64-qemux86-64-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/qemux86-64
[amd64-qemux86-64-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora/
[amd64-qemux86-64-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-buildpack-deps/
[amd64-qemux86-64-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-node/
[amd64-qemux86-64-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-node/tags/manage/
[amd64-qemux86-64-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-python/
[amd64-qemux86-64-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-python/tags/manage/
[amd64-qemux86-64-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/qemux86-64
[amd64-qemux86-64-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/qemux86-64
[amd64-qemux86-64-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/qemux86-64
[amd64-qemux86-64-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/qemux86-64
[amd64-qemux86-64-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-golang/
[amd64-qemux86-64-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-golang/tags/manage/
[amd64-qemux86-64-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/qemux86-64
[amd64-qemux86-64-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-openjdk/
[amd64-qemux86-64-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/qemux86-64-fedora-openjdk/tags/manage/
[amd64-qemux86-64-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/qemux86-64

[armv7hf-ts4900-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-debian/
[armv7hf-ts4900-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-buildpack-deps/
[armv7hf-ts4900-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-node/
[armv7hf-ts4900-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-node/tags/manage/
[armv7hf-ts4900-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-python/
[armv7hf-ts4900-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-python/tags/manage/
[armv7hf-ts4900-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/ts4900
[armv7hf-ts4900-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/ts4900
[armv7hf-ts4900-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/ts4900
[armv7hf-ts4900-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/ts4900
[armv7hf-ts4900-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-golang/
[armv7hf-ts4900-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-golang/tags/manage/
[armv7hf-ts4900-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/ts4900
[armv7hf-ts4900-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-openjdk/
[armv7hf-ts4900-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-openjdk/tags/manage/
[armv7hf-ts4900-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/ts4900
[armv7hf-ts4900-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine/
[armv7hf-ts4900-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-buildpack-deps/
[armv7hf-ts4900-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-node/
[armv7hf-ts4900-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-node/tags/manage/
[armv7hf-ts4900-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-python/
[armv7hf-ts4900-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-python/tags/manage/
[armv7hf-ts4900-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/ts4900
[armv7hf-ts4900-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/ts4900
[armv7hf-ts4900-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/ts4900
[armv7hf-ts4900-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/ts4900
[armv7hf-ts4900-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-golang/
[armv7hf-ts4900-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-golang/tags/manage/
[armv7hf-ts4900-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/ts4900
[armv7hf-ts4900-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-openjdk/
[armv7hf-ts4900-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-alpine-openjdk/tags/manage/
[armv7hf-ts4900-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/ts4900
[armv7hf-ts4900-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora/
[armv7hf-ts4900-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-buildpack-deps/
[armv7hf-ts4900-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-node/
[armv7hf-ts4900-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-node/tags/manage/
[armv7hf-ts4900-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-python/
[armv7hf-ts4900-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-python/tags/manage/
[armv7hf-ts4900-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/ts4900
[armv7hf-ts4900-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/ts4900
[armv7hf-ts4900-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/ts4900
[armv7hf-ts4900-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/ts4900
[armv7hf-ts4900-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-golang/
[armv7hf-ts4900-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-golang/tags/manage/
[armv7hf-ts4900-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/ts4900
[armv7hf-ts4900-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-openjdk/
[armv7hf-ts4900-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts4900-fedora-openjdk/tags/manage/
[armv7hf-ts4900-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/ts4900

[armel-ts7700-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts7700-debian/
[armel-ts7700-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts7700-buildpack-deps/
[armel-ts7700-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts7700-node/
[armel-ts7700-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts7700-node/tags/manage/
[armel-ts7700-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts7700-python/
[armel-ts7700-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts7700-python/tags/manage/
[armel-ts7700-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/ts7700
[armel-ts7700-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/ts7700
[armel-ts7700-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/ts7700
[armel-ts7700-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/ts7700
[armel-ts7700-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts7700-golang/
[armel-ts7700-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts7700-golang/tags/manage/
[armel-ts7700-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/ts7700
[armel-ts7700-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/ts7700-openjdk/
[armel-ts7700-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/ts7700-openjdk/tags/manage/
[armel-ts7700-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/ts7700

[armv7hf-artik5-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-debian/
[armv7hf-artik5-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-buildpack-deps/
[armv7hf-artik5-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-node/
[armv7hf-artik5-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-node/tags/manage/
[armv7hf-artik5-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-python/
[armv7hf-artik5-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-python/tags/manage/
[armv7hf-artik5-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/artik5
[armv7hf-artik5-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/artik5
[armv7hf-artik5-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/artik5
[armv7hf-artik5-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/artik5
[armv7hf-artik5-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-golang/
[armv7hf-artik5-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-golang/tags/manage/
[armv7hf-artik5-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/artik5
[armv7hf-artik5-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-openjdk/
[armv7hf-artik5-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-openjdk/tags/manage/
[armv7hf-artik5-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/artik5
[armv7hf-artik5-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-alpine/
[armv7hf-artik5-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-buildpack-deps/
[armv7hf-artik5-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-node/
[armv7hf-artik5-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-node/tags/manage/
[armv7hf-artik5-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-python/
[armv7hf-artik5-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-python/tags/manage/
[armv7hf-artik5-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/artik5
[armv7hf-artik5-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/artik5
[armv7hf-artik5-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/artik5
[armv7hf-artik5-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/artik5
[armv7hf-artik5-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-golang/
[armv7hf-artik5-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-golang/tags/manage/
[armv7hf-artik5-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/artik5
[armv7hf-artik5-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-openjdk/
[armv7hf-artik5-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-alpine-openjdk/tags/manage/
[armv7hf-artik5-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/artik5
[armv7hf-artik5-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-fedora/
[armv7hf-artik5-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-buildpack-deps/
[armv7hf-artik5-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-node/
[armv7hf-artik5-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-node/tags/manage/
[armv7hf-artik5-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-python/
[armv7hf-artik5-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-python/tags/manage/
[armv7hf-artik5-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/artik5
[armv7hf-artik5-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/artik5
[armv7hf-artik5-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/artik5
[armv7hf-artik5-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/artik5
[armv7hf-artik5-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-golang/
[armv7hf-artik5-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-golang/tags/manage/
[armv7hf-artik5-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/artik5
[armv7hf-artik5-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-openjdk/
[armv7hf-artik5-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik5-fedora-openjdk/tags/manage/
[armv7hf-artik5-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/artik5

[armv7hf-artik10-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-debian/
[armv7hf-artik10-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-buildpack-deps/
[armv7hf-artik10-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-node/
[armv7hf-artik10-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-node/tags/manage/
[armv7hf-artik10-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-python/
[armv7hf-artik10-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-python/tags/manage/
[armv7hf-artik10-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/artik10
[armv7hf-artik10-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/artik10
[armv7hf-artik10-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/artik10
[armv7hf-artik10-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/artik10
[armv7hf-artik10-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-golang/
[armv7hf-artik10-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-golang/tags/manage/
[armv7hf-artik10-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/artik10
[armv7hf-artik10-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-openjdk/
[armv7hf-artik10-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-openjdk/tags/manage/
[armv7hf-artik10-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/artik10
[armv7hf-artik10-alpine-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-alpine/
[armv7hf-artik10-alpine-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-buildpack-deps/
[armv7hf-artik10-alpine-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-node/
[armv7hf-artik10-alpine-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-node/tags/manage/
[armv7hf-artik10-alpine-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-python/
[armv7hf-artik10-alpine-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-python/tags/manage/
[armv7hf-artik10-alpine-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/artik10
[armv7hf-artik10-alpine-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/artik10
[armv7hf-artik10-alpine-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/artik10
[armv7hf-artik10-alpine-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/artik10
[armv7hf-artik10-alpine-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-golang/
[armv7hf-artik10-alpine-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-golang/tags/manage/
[armv7hf-artik10-alpine-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/artik10
[armv7hf-artik10-alpine-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-openjdk/
[armv7hf-artik10-alpine-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-alpine-openjdk/tags/manage/
[armv7hf-artik10-alpine-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/artik10
[armv7hf-artik10-fedora-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-fedora/
[armv7hf-artik10-fedora-buildpack-deps-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-buildpack-deps/
[armv7hf-artik10-fedora-node-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-node/
[armv7hf-artik10-fedora-node-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-node/tags/manage/
[armv7hf-artik10-fedora-python-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-python/
[armv7hf-artik10-fedora-python-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-python/tags/manage/
[armv7hf-artik10-fedora-github-link]:https://github.com/resin-io-library/base-images/tree/master/device-base/artik10
[armv7hf-artik10-fedora-buildpack-deps-github-link]:https://github.com/resin-io-library/base-images/tree/master/buildpack-deps/artik10
[armv7hf-artik10-fedora-node-github-link]:https://github.com/resin-io-library/base-images/tree/master/node/artik10
[armv7hf-artik10-fedora-python-github-link]:https://github.com/resin-io-library/base-images/tree/master/python/artik10
[armv7hf-artik10-fedora-golang-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-golang/
[armv7hf-artik10-fedora-golang-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-golang/tags/manage/
[armv7hf-artik10-fedora-golang-github-link]:https://github.com/resin-io-library/base-images/tree/master/golang/artik10
[armv7hf-artik10-fedora-openjdk-dockerhub-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-openjdk/
[armv7hf-artik10-fedora-openjdk-dockerhub-tag-link]:https://registry.hub.docker.com/u/resin/artik10-fedora-openjdk/tags/manage/
[armv7hf-artik10-fedora-openjdk-github-link]:https://github.com/resin-io-library/base-images/tree/master/openjdk/artik10
