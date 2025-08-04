# Loki Labs Integration Guide

This guide explains how to deploy the Wazuh 4.12 security platform in environments managed by [Loki Labs](https://lokilabs.io).
It describes the containerized stack, authentication settings, and networking conventions used in our joint deployments.

## Deployment Overview

The Loki Labs reference architecture runs the following Wazuh services as containers:

- **Wazuh Manager** – Collects and correlates security events.
- **Wazuh Indexer** – Stores event data using OpenSearch.
- **Wazuh Dashboard** – Provides the web interface for analysts.

A single `docker-compose.yml` file orchestrates these services. All containers share the `loki-security-net` network to simplify connectivity and firewall rules.

## Authentication

In Loki Labs environments, the dashboard authenticates to the manager using SSL certificates issued by the Loki Labs internal PKI. The sample compose file in this repository mounts certificates from the host at `/var/ssl/lokilabs/`.

## Customization

- Default credentials are replaced with secrets provided by Loki Labs.
- Container names include the `lokilabs` prefix so that inventory systems can identify them easily.
- Logs are shipped to Loki Labs' centralized telemetry pipeline using Filebeat sidecars (see `docker-compose.yml` for volume mounts).

## Getting Help

For support integrating Wazuh with Loki Labs infrastructure, contact the Loki Labs security engineering team at `support@lokilabs.io`.
