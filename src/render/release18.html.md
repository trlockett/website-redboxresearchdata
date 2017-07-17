---
title: "1.8 Release Notes"
layout: "generic"
order: 1
heading1: "Releases"
heading2: "ReDBox"
---
## 1.8 - ReDBox - Mint

### Release Notes
The 1.8 release of ReDBox and Mint (1.3 Fascinator) introduces significant improvements to functionality and configuration in a number of areas:

1. Revision of institutional builds. A [new institutional build](https://github.com/redbox-mint/redbox-build-distro)&nbsp;has been created that includes all the commonly used and supported ReDBox plugins and can be enabled and disabled via configuration. It also removes the requirement of using Maven as part of institutional builds.
2. Revamped configuration file model that splits system-config.json into smaller more manageable units. This should aid in future upgrades as well as allow them to be edited via the new ReDBox Administrator interface (new tool optional install).
3. [Improved security model (using Spring Security) that allows easy locking down of views by URL pattern.](./documentation/technical/redbox-view-security)
4. Improved ability to customise the configurable forms. New features include the ability to configure the form layout (e.g. tabbed, wizard or no tabs view), configurable page validation functions (on save, validate just the active tab or the whole form), ability to write custom [validatious functions](https://github.com/cjohansen/validatious) and plug them in via configuration
5. New improved harvester functionality to replace existing harvester and alerts available via new Harvest Manager tool (optional).
6. New database API for writing configuration items. Attributes associated with users are now persisted and can be used by features such as sharing data management plans
7. [Internal Roles plugin now has the ability to set a default role to a user if there is nothing configured for them.&nbsp;](https://github.com/the-fascinator/the-fascinator/blob/master/plugins/roles/internal/src/main/java/com/googlecode/fascinator/roles/internal/InternalRoles.java)
8. Internal Roles plugin admin interface enhanced so that you can now lookup and add a user based on user attributes. For example, you can now apply a role to an AAF user (via the internal roles plugin) if you are know what their email address is.
9. Improved curation performance via the new Curation Manager service(once curation manager is released)
10. Upgrades of various core libraries

Bug fixes as outlined in:
   [ReDBox](https://github.com/redbox-mint/redbox/issues?q=milestone%3A%22Redbox+1.8%22)
   [Fascinator](https://github.com/redbox-mint/redbox/issues?q=milestone%3A%22Redbox+1.8%22)

As mentioned in the above list of improvements there are three complimentary tools that can optionally be installed.

### Harvest Manager

ReDBox and Mint have long had tools to harvest data into the system but they have the following limitations:

1. Mint harvests are restricted to CSV files from the file system
2. ReDBox harvests (known alerts) are restricted to either CSV or XML (RIF-CS) files from the file system and can only create dataset records.
3. The logging of harvest runs was limited and it was difficult to determine why a harvest failed
4. There was no method to implement business rule validation into a harvest&nbsp;

The [Harvest Manager](https://github.com/redbox-harvester) is java based tool that utilises the [Spring Integration](http://projects.spring.io/spring-integration/) framework to receive data from a variety of sources (such as a RDMS database, the file system, message queue) perform the necessary transforms to the data and produce a message that can be consumed by ReDBox or Mint to create, update or delete a record.

### Upgrading to 1.8

The 1.8 version of ReDBox has introduced changes to how the application is deployed and managed. The old institutional builds model has been removed and the application now comes pre-packaged with all the supported plugins so that it's much simpler to deploy. Additionally the configuration of the application has been revamped so that future versions of the application will be simpler to upgrade.

Before upgrading, you will need to convert your existing institutional build to the new format. Please read the [documentation](https://github.com/redbox-mint-contrib/rb-sample-1.8-institutional-build/blob/master/README.md) for more information on how to upgrade.

Process
=======
1. Download the application tarballs (ReDBox and Mint)
2. Shutdown ReDBox and Mint.&nbsp;
3. Remove the server/lib and server/plugin directories of ReDBox and Mint
4. Extract the tarballs and copy them over the existing ReDBox and Mint
5. Overlay your changes from your new format institutional build
6. Restart ReDBox and Mint
7. Run the tf_restore.sh (tf_restore.bat in Windows) scripts to migrate the data
