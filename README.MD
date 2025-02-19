## Installing Terraform
Terraform is an open-source infrastructure as code (IaC) tool that allows you to define and provision your infrastructure using a high-level configuration language. This guide will help you install Terraform on your local machine.

Before you begin, ensure that you have the following prerequisites:

- **Operating System**: Terraform is available for various operating systems, including Linux, macOS, and Windows. Make sure you have one of these operating systems.

### Installation

Follow these steps to install Terraform:

#### For (Linux/macOS)
1. **Download Terraform**: Visit the official Terraform website to download the latest version of Terraform. You can download it from [here](https://www.terraform.io/downloads.html).

2. **Extract the Archive (Linux/macOS)**:

   ```bash
   # Replace `terraform.zip` with the actual filename you downloaded.
   unzip terraform.zip

   # Move the Terraform binary to a directory in your PATH.
   sudo mv terraform /usr/local/bin/

#### For (Windows)

1. Download the Windows version from the Terraform website. You can download it from [here](https://www.terraform.io/downloads.html).
2. Extract the downloaded archive.
3. Move the `terraform.exe` binary to a directory in your `PATH`.

### Verifying the Installation
After installing Terraform, it's a good practice to verify that the installation was successful. You can do this by running:
    ```
    terraform -help
    Usage: terraform [-version] [-help] <command> [args]
    ```

## Installing Terragrunt 
Terragrunt is a powerful wrapper for Terraform that simplifies and enhances your Terraform configurations. This guide will help you install Terragrunt on both Windows and Linux systems.

Before you begin, ensure you have the following prerequisites:

- **Terraform Installed**: Terragrunt requires Terraform to be installed on your system. Make sure you have Terraform installed and configured properly.

### Installation

Follow these steps to install Terragrunt:

#### Download from releases page
1. Go to the [Release Page](https://github.com/gruntwork-io/terragrunt/releases).
2. Downloading the binary for your operating system: e.g., if you’re on a Mac, download `terragrunt_darwin_amd64`; if you’re on Windows, download `terragrunt_windows_amd64.exe`, etc.
3. Rename the downloaded file to `terragrunt`.
4. Add execute permissions to the binary. E.g., On Linux and Mac: `chmod u+x terragrunt`.
5. Put the binary somewhere on your `PATH`. E.g., On Linux and Mac: `mv terragrunt /usr/local/bin/terragrunt`.

#### Install via a package manager
Note that all the different package managers are third party.The third party Terragrunt packages may not be updated with the latest version, but are often close. Please check your version against the latest available on the [Release Page](https://github.com/gruntwork-io/terragrunt/releases). If you want the latest version, the recommended installation option is to download from the [Release Page](https://github.com/gruntwork-io/terragrunt/releases).

1. **Windows:** You can install Terragrunt on Windows using Chocolatey: `choco install terragrunt`.

2. **macOS:** You can install Terragrunt on macOS using Homebrew: `brew install terragrunt`.

3. **Linux:** Most Linux users can use Homebrew: `brew install terragrunt`. Arch Linux users can use `pacman -S terragrunt` to install it `community-terragrunt`.

### Verify the Installation: 
Open a Command Prompt and run:
   ```
   terragrunt --version
   ```



# Azure Setup Guide

This guide provides step-by-step instructions for setting up Azure CLI, logging into your Azure account, creating a Service Principal, and managing subscriptions.

## Table of Contents
1. [Install Azure CLI](#install-azure-cli)
2. [Log in to Azure](#log-in-to-azure)
3. [Create a Service Principal](#create-a-service-principal)
4. [Manage Multiple Subscriptions](#manage-multiple-subscriptions)

## Install Azure CLI

1. Choose your operating system:
   - [Windows](#windows)
   - [macOS](#macos)
   - [Linux](#linux)

### Windows

1. Download the MSI installer from the [official Microsoft website](https://aka.ms/installazurecliwindows).
2. Run the installer and follow the on-screen instructions.
3. Restart your command prompt or PowerShell to use Azure CLI.

### macOS

Use Homebrew to install Azure CLI:

```bash
brew update && brew install azure-cli
```

### Linux

For Ubuntu or Debian, use these commands:

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

For other distributions, check the [official Azure CLI installation guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

## Log in to Azure

1. Open a terminal or command prompt.
2. Run the following command:

```bash
az login
```

3. Your default browser will open. Sign in with your Azure account credentials.
4. After successful login, you'll see a JSON output with your subscription information.

## Create a Service Principal

1. Ensure you're logged in to Azure CLI.
2. Run the following command to create a Service Principal:

```bash
az ad sp create-for-rbac --name "MyServicePrincipal" --role contributor --scopes /subscriptions/<subscription-id>
```

Replace `<subscription-id>` with your Azure subscription ID.

3. Save the output JSON. It contains important credentials:
   - `appId`: The client ID for your application
   - `password`: The client secret
   - `tenant`: The tenant ID

This appID, password, tenantID are used for CI/CD of Github Actions.

## Manage Multiple Subscriptions

If you have more than one subscription:

1. List all subscriptions:

```bash
az account list --output table
```

2. Set the active subscription:

```bash
az account set --subscription <subscription-id-or-name>
```

3. Verify the current subscription:

```bash
az account show
```

Remember to keep your Service Principal credentials and subscription information secure. Never share them publicly or commit them to version control systems.
