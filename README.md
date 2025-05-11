
# AWS - Using WinSCP and Elastic IPs

This guide explains how to transfer files from your local machine to a remote AWS Ubuntu instance using WinSCP, and also covers the concept and setup of Elastic IP addresses on AWS.

---

## 📁 File Transfer to AWS Linux Machine using WinSCP

### 🔧 Tools Required
- **WinSCP** (Windows only)
- **PuTTYgen** (to convert `.pem` to `.ppk`)

### 🖥️ Steps to Connect:
1. **Create an Ubuntu EC2 Instance** on AWS.
2. Download the key pair (`.pem` file) during instance creation.
3. **Convert `.pem` to `.ppk`** using **PuTTYgen**:
   - Open PuTTYgen.
   - Load `.pem` file and save the private key as `.ppk`.

4. **Open WinSCP** and set up a new site:
   - **Host name**: Public IP of the EC2 instance.
   - **Username**: e.g., `ubuntu`
   - Leave password blank.
   - Click **Advanced → SSH → Authentication**:
     - Upload the `.ppk` file.

5. Connect to the remote machine. Default directory: `/home/ubuntu`.

### 📂 File Transfer
- Hidden files start with a dot (`.`).
- Drag and drop files between your system and the remote instance.
- Files can be edited directly in WinSCP.

> **Mac Users:** Use **FileZilla**, which functions similarly to WinSCP.

---

## 📡 Understanding IP Addresses in AWS

### 🔢 IP Versions
- IPv4
- IPv6

### 🏷️ Types of IP Addresses
- **Private IP**: Internal communication.
- **Public IP**: Accessible from the internet.

#### 🔁 Dynamic vs. Static Public IPs
- **Dynamic IP**: Changes on reboot or stop/start.
- **Static IP**: Remains constant.

> Example: If your router assigns a new IP each time it reboots, it's dynamic. A static IP remains fixed.

---

## 🌐 Elastic IPs

### 💡 What is an Elastic IP?
- A **static, public IPv4 address** provided by AWS.
- Stays the same even if you stop/start or terminate and recreate your instance.

### ✅ Benefits
1. Keeps IP consistent across instance restarts.
2. Can be re-associated to a new instance after termination.

### 🔗 How to Allocate & Associate Elastic IP
1. Go to **EC2 Dashboard → Network & Security → Elastic IPs**.
2. **Allocate new address**.
3. **Associate** with your instance.
4. You can view the assigned Elastic IP in the instance dashboard.

> ⚠️ Note: A single Elastic IP can only be assigned to **one instance at a time**.

---

## 🗑️ Termination & IP Management

- Before terminating an instance:
  - **Disassociate** the Elastic IP.
  - **Re-associate** with a new instance if needed.
- If no longer needed, **release** the Elastic IP to avoid charges.

---
