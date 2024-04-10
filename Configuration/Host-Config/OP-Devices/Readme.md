# On-Premises Device Configuration

Welcome to the central documentation for all on-premises devices within my home lab environment. These devices serve as hosts for the virtual machines that constitute the lab's infrastructure. Below is a detailed overview of each device's hardware configuration, along with a brief description of its role and the services it supports within the network.

## Asus ROG Strix G531GT - Virtualization Workhorse

| Component           | Specification                           | Description                                               |
| ------------------- | --------------------------------------- | --------------------------------------------------------- |
| **CPU**             | Intel i5-9300H (2.4GHz, 4 cores, 8 logical processors) | Powers the core virtualization services using Hyper-V.    |
| **RAM**             | 32GB DDR4 (dual-channel)                | Ample memory for running multiple VMs concurrently.       |
| **Architecture**    | x64                                     | Supports a wide range of 64-bit guest operating systems.  |
| **Storage**         | 1TB M.2 SSD                             | Fast storage for VMs, ensuring quick boot and load times. |
| **Graphics Card**   | Nvidia GTX 1650                         | Handles graphic-intensive processes and VMs.              |
| **Network Adapter** | Ethernet, WiFi                          | Dual connectivity options for flexible network integration.|
| **Services**        | Hyper-V Management                      | Manages and orchestrates VMs for various lab scenarios.   |

## Dell Inspiron 3670 - Core Services Provider

| Component           | Specification                           | Description                                               |
| ------------------- | --------------------------------------- | --------------------------------------------------------- |
| **CPU**             | Intel Core i5-8400 (2.8GHz, 6 cores, 6 Logical Processors) | Supports day-to-day lab operations and services.          |
| **RAM**             | 8GB DDR4 (dual-channel)                | Sufficient for running essential services effectively.    |
| **Architecture**    | x64                                     | Ensures compatibility with modern operating systems and software. |
| **Storage**         | 500GB M.2 SSD (boot), Seagate 4TB external SSD (storage) | Dedicated boot drive and expansive storage for backups and file sharing. |
| **Graphics Card**   | Intel UHD Graphics 630                 | Provides basic video output for management and troubleshooting. |
| **Network Adapter** | WiFi                                    | Wireless connectivity for flexible placement and redundancy. |
| **Services**        | Active Directory, IIS, File Sharing    | Central identity services, web hosting, and network storage capabilities. |

---

**Network Configuration Overview**:

_To be added soon, outlining the network topology, addressing, and any specific configurations such as VLANs or firewall rules._

Please ensure to visit each device's specific folder for more in-depth configuration details, service descriptions, and role within the home lab environment.
