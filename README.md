# Microsoft CI Automation

- [Introduction](#introduction)
- [Contributing](#contributing)
- [Issues](#issues)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Environment](#tools)
- [Next Steps](#next-steps)
- [References](#references)

# Introduction

This project consists of a set of Powershell scripts to automate a Windows environment with all the tools and services 
required to build, deploy and run .NET applications.

One of the scripts makes the clone of an example application (You can find the application link in the references section), 
installs all the required dependencies, builds and deploy locally by connecting to a SQL Express database.

Part of the dependencies are installed using Chocolatey. Chocolatey is a tool for Software Management Automation, focused on Windows platform. 
It was created a few years ago, but it already has great acceptance on the part of the community. 
With it you can install packages with just a few commands, without worrying about all the variables involved in 
the environment.
The best thing, is that everyone can contribute with new scripts and improve existing ones. 

If you want to reduce your work in setting up a Windows environment, you have come to the right place!

__NOTE__: For more details about Chocolatey, see the reference section at the bottom of the page.

# Contributing

If you find this project useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with they may encounter
- Support the development of this project sharing in your social media or buying me a coffee/beer. :)

# Issues

This project was created in just over 15 hours and therefore, bugs may exist. 
Be patient if you encounter any problems and help me improve the scripts so that others can benefit as well.

The scripts contained in this project have been tested with Windows Server 2016.

If you are using a different version of Windows and find a problem with one of the scripts, 
feel free to submit a pull request, open an issue here on Github or even send me an email.

# Prerequisites

- Windows Server 2012 or higher (I recommend 2016)
- 4 GB RAM or higher
- Internet Connection
- Powershell v3+ (with administrative permissions)

# Installation

You can run the scripts individually or a set of them. This will vary according to your needs. 
But I created the project for those who just installed Windows Server on a machine and just want to run a command, 
go out for a beer and when they come back, everything is installed, configured and running.

To perform the full environment installation, do the following

```bash
./setup.ps1
```
__NOTE__: You must run the script with administrator permissions. In addition, you must run the following command line:

```bash
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

The above command sets the execution policy to bypass for only the current PowerShell session.  
After the window is closed, the next PowerShell session will open running with the default execution policy.  
“Bypass” means nothing is blocked and no warnings, prompts, or messages will be displayed.

# Environment

After running all the scripts, you will have an environment for development, 
testing or even production with the principal Microsoft technologies and frameworks up and running.

__NOTE__: The complete execution of all the scripts can vary according to the configurations of the machine 
in which it is running and also with the speed of the internet. In all the tests that I performed, 
the whole process took between 30 ~ 60 minutes.

Below you can see the tools, services, and frameworks that are installed at the end of the process:


| *Tool*        | *Version*     | 
| ------------- | ------------- | 
| Chocolatey    | 0.10.3        |
| Git           | 2.11          |
| .NET Core SDK | 1.0.3         |
| .NET Dev Pack | 4.6.1         |
| 7zip          | 16.0.2        |
| MSDTC         |               |
| MSMQ          |               |
| IIS           | 8.5           |
| SQL EXPRESS   | 2014          |
| Asp.Net Core  | 4.5           |
| SQLPS         | 4.5           |



# Next Steps

The main idea is to evolve and integrate scripts created with other market tools, such as:

- Docker
- Chef
- Puppet

If you have knowledge in one of these tools and want to contribute. Feel free to make a fork.

# References

* https://chocolatey.org/
* https://msdn.microsoft.com/en-us/powershell/mt173057.aspx
* https://github.com/Teletrax/CIAssignment