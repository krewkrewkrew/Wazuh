# Wazuh 4.12 Endpoint Security Platform

This repository provides a Loki Labs–oriented distribution of the Wazuh 4.12 XDR and SIEM platform. It mirrors the official Wazuh structure while applying conventions and defaults used in [Loki Labs](https://lokilabs.io) deployments. The goal is to offer our clients a secure, cost‑effective stack that integrates seamlessly with Loki Labs services.

## Data Collection from Any Endpoint

Wazuh agents and integrations ingest logs, metrics, and alerts from Windows, Linux, macOS, network devices, containers, and cloud workloads. By centralizing data from diverse sources, Wazuh enables unified visibility and correlation across the environment while remaining cost‑effective.

## Core Components and Modules

- **Wazuh Manager** – Correlates events, triggers alerts, and orchestrates responses.
- **Wazuh Agent** – Lightweight endpoint collector for log data, file integrity, and active response.
- **Wazuh Indexer** – OpenSearch-based storage and search engine for security events.
- **Wazuh Dashboard** – Web UI for visualizing alerts and managing the platform.
- **File Integrity Monitoring (FIM)** – Tracks changes to critical files and directories.
- **Vulnerability Detector** – Identifies outdated packages and known vulnerabilities.
- **Security Configuration Assessment (SCA)** – Audits endpoints against compliance policies.
- **Active Response** – Executes automatic containment or remediation actions.

## Use Cases

- Centralized threat detection and incident response
- Compliance monitoring for standards such as PCI DSS, HIPAA, and ISO 27001
- Vulnerability management and patch verification
- Log aggregation across commercial and open-source systems
- Cloud, container, and hybrid infrastructure monitoring

## Cost-Efficient Security

Because Wazuh is free and open source, we can deploy it broadly without per-endpoint licensing fees. Horizontal scaling and commodity hardware further reduce the total cost of ownership while delivering enterprise-grade security analytics.

## Loki Labs Deployment

The `docker-compose.yml` file in this repository launches the Wazuh manager, indexer, dashboard, and a Filebeat sidecar on a dedicated `loki-security-net` network. Services are preconfigured to use certificates issued by the Loki Labs PKI and to forward alerts into the Loki Labs telemetry pipeline.

Refer to [docs/loki-labs-integration.md](docs/loki-labs-integration.md) for details on authentication, customization, and support resources.

## Further Reading

- [Official Wazuh documentation](https://documentation.wazuh.com/4.12/)
- [Wazuh community resources](https://wazuh.com/community/)
