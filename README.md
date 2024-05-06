# 3ENTLEY-HOME-LAB Overview

Welcome to the comprehensive documentation of the 3ENTLEY-HOME-LAB. This document serves as an introduction to the various components that comprise the lab environment. For detailed information on each specific device or service, please refer to the corresponding README file within the relevant device or service directory.

## Services

Each service in the 3ENTLEY-HOME-LAB is designed to simulate an enterprise-level environment, allowing for robust practice, development, and testing. Here's an outline of the primary services and their purposes:

### Active Directory

**Purpose**: The Active Directory (AD) service is the cornerstone of the lab, providing directory services and user management akin to a corporate environment. It is essential for practicing AD administration skills, including group policy, user provisioning, and access control. 

**Benefits**: With AD, experimentation is encouraged, enabling the refinement of skills without the risk associated with production environments, such as data loss or service disruption.

--

# Device Configuration

Welcome to the central documentation for all on-premises devices within my home lab environment. These devices serve as hosts for the virtual machines that constitute the lab's infrastructure. Below is a detailed overview of each device's hardware configuration, along with a brief description of its role and the services it supports within the network.

## Dell Inspiron 3670 - Core Services Provider

| Component           | Specification                           | Description                                               |
| ------------------- | --------------------------------------- | ---------------------------------------------------------         |
| **CPU**             | Intel Core i5-8400 (2.8GHz, 6 cores, 6 logical processors) | Supports day-to-day lab operations and services.          |
| **RAM**             | 8GB DDR4 (dual-channel)                 | Sufficient for running essential services effectively.          |
| **Architecture**    | x64                                     | Ensures compatibility with modern operating systems and software. |
| **Storage**         | 500GB M.2 SSD (bm), Seagate 4TB external SSD (sm) | Dedicated boot drive and expansive storage for backups and file sharing. |
| **Graphics Card**   | Intel UHD Graphics 630                  | Provides basic video output for management and troubleshooting.  |
| **Network Adapter** | Wi-Fi & Ethernet                        | Wireless connectivity for flexible placement and redundancy. |
| **Services**        | Active Directory, IIS, File Sharing     | Central identity services, web hosting, and network storage capabilities. |

---

## Asus Rog Strix G531GT - Powerhouse 

| Component           | Specification                           | Description                                               |
| ------------------- | --------------------------------------- | --------------------------------------------------------- |
| **CPU**             | Intel Core i5-9300H (2.4GHz, 4 cores 8 logical processors) |
| **RAM**             | 32GB DDR4 (dual-channel)                | Sufficient for running essential services effectively.    |
| **Architecture**    | x64                                     | Ensures compatibility with modern operating systems and software. |
| **Storage**         | 500GB M.2 SSD (bm), SanDisk 2TB external SSD (sm) | Dedicated boot drive and expansive storage for backups and file sharing. |
| **Graphics Card**   | Intel UHD Graphics 630                  | Provides basic video output for management and troubleshooting. |
| **Graphics Card 2** | NVIDIA GeForce GTX 1650                 | Provides basic video output for management and troubleshooting. |
| **Network Adapter** | Wi-Fi & Ethernet                        | Wireless connectivity for flexible placement and redundancy. |
| **Services**        | Remote Desktop, LLM host                | Allows for remote connection to the domain | 

