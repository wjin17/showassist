#!/bin/bash
podman-compose down
podman container prune -f
podman image prune -f
podman volume prune -f