---
title: "ReDBox DLC"
layout: "generic"
order: 1
heading1: "ReDBox Data Life Cycle"
heading2: "ReDBox"
---
### ReDBox DLC
ReDBox DLC is the next step forward for ReDBox. With the help of supporters like Research Data Services (RDS) and the University of Technology Sydney (UTS), QCIF is creating the ReDBox DLC service to support the Research Data Life Cycle Framework (DLCF). The DLCF is an Australian initiative designed to assist researchers in connecting their research activities with their research data as well as the eResearch infrastructure and services used to store, manage and process the data. ReDBox 2.0, slated for release mid 2018, will support the DLCF by assisting users to provision and manage storage infrastructure, then allowing users to extract manifests of data back into ReDBox and publishing the data files alongside the data collection metadata.

![ReDBox Supporting the DCC Curation Life Cycle](./images/curationlifecycle.png)

*How ReDBox 2.0 will support the DCC Curation Life Cycle*

### The Research Activity Portal and RAiDs
In a major step towards supporting the DLC, QCIF has collaborated with RDS to create a portal available to all researchers to register their research activities. Called the Research Activity Portal [www.raportal.org.au](https://www.raportal.org.au), the portal will provide a Research Activity ID (RAiD) which is used as a universal identifier for linking researchers, research activities and research data. This function is also being embedded in the ReDBox platform, allowing researchers to generate RAiDs at the RDMP stage and apply RAiDs to their data collections. To learn more about the RDS RAiD visit the RAiD website at [www.raid.orga.au](https://www.raid.org.au).

### RAiDs in ReDBox
RAiDs are now supported in the DMP Tool in ReDBox 1.9, allowing users to add existing RAiDs to a data management plan or mint new RAiDs. In ReDBox 2.0 the RAiD will be a key identifier to tie together the data management plan, the provisioned storage and the published data collection.

### ReDBox and Provisioning
A key stage in the DLCF is linking research activities to the infrastructure and services used to store, manage and process research data. Currently the ReDBox DMP tool allows researchers to indicate resource requirements such as expected storage volumes. QCIF plans to extend ReDBox provisioning functions by either automating the provisioning or managing resource requests. For example a researcher could request 20 GB of CloudStor storage and have that automatically provisioned via the CloudStor API. For larger storage requests ReDBox would trigger a workflow, based on both institutional and storage provider business rules, to request and track institutional and administrative authorisation.

### ReDBox and Data Harvesting
Once researchers have acquired their storage and compute resources, it is planned that ReDBox will assist researchers to directly manage and publish their data files. For example, using the Intersect Collections tool would allow researchers to select the files they want to manage from their CloudStor storage, create a metadata manifest of the files, and harvest the manifest (and optionally the data files) into ReDBox. This places the research data files under ReDBox and institutional control. The files and metadata can then be published for open access.

### ReDBox in the Cloud
With ReDBox 2.0 QCIF are using a new web development framework that will allow QCIF to move beyond hosting individual ReDBox Lite instances to providing the full ReDBox functionality in the Cloud using the Software as a Service (SaaS) model. The Research Activity Portal can already be extended to provide the Data Management Planning Tool for institutions.

### The Benefits of ReDBox as a Research Data Management Platform
Through this approach researchers will have ReDBox as a single point of access to key elements of the DLCF, including planning, provisioning, data harvesting and publishing. It will give institutions greater visibility into how researchers manage and publish their data while providing assurances that researcher practices conform to Australian standards and expectations.


![ReDBox DLC](./images/redboxdlc.png)

*ReDBox 2.0 will be a complete data management system for supporting the Research Data Life Cycle Framework*

