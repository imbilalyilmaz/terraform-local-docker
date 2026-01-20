# Terraform Local Docker Provisioning 🐳 🛠️

This project is prepared to demonstrate **Infrastructure as Code (IaC)** principles in a practical way **without any Cloud cost** (AWS, Azure, etc.).

Using Terraform, an Nginx web server is provisioned on a local machine via Docker Desktop / Docker Engine.

---

## 🎯 Project Goal and Learning Outcomes

This repository demonstrates hands-on usage of the following **DevOps and SRE** skills:

* **Infrastructure as Code (IaC):** Managing infrastructure declaratively instead of manual commands like `docker run`.
* **Terraform Resource Management:** Defining and managing `docker_image` and `docker_container` resources.
* **Modular Structure:** Writing reusable and parameterized code using `variables.tf` and `outputs.tf`.
* **Volume Mounting:** Dynamically mounting local files (`index.html`) into the container.
* **State Management:** Understanding Terraform state files and resource lifecycle.

---

## 📂 Project Structure

```text
.
├── main.tf        # Provider and resource definitions (main configuration)
├── variables.tf   # Variable definitions (ports, names, etc.)
├── outputs.tf     # Output values (container ID, URL)
├── index.html     # Custom HTML page served by Nginx
└── README.md      # Project documentation
```

---

## 🚀 Installation and Usage

### Requirements

* [Terraform](https://developer.hashicorp.com/terraform) (CLI must be installed)
* [Docker](https://www.docker.com/) (Docker daemon must be running)

---

### Step 1: Initialize the Project

Download the required Terraform Docker provider:

```bash
terraform init
```

---

### Step 2: Create an Execution Plan

Preview the changes Terraform will apply:

```bash
terraform plan
```

---

### Step 3: Apply the Configuration

Provision the infrastructure (type `yes` when prompted):

```bash
terraform apply
```

---

### Step 4: Test

Once completed, navigate to the URL shown in the Outputs section (default: [http://localhost:8000](http://localhost:8000)).

You should see **"Merhaba Dunya!"** (or the content defined in `index.html`) in your browser.

---

## ⚙️ Configuration (Variables)

You can customize the project by editing `variables.tf` or by passing variables via the command line.

| Variable Name    | Description             | Default Value    |
| ---------------- | ----------------------- | ---------------- |
| `container_name` | Docker container name   | `tutorial_nginx` |
| `image_name`     | Docker image to use     | `nginx:latest`   |
| `internal_port`  | Container internal port | `80`             |
| `external_port`  | Localhost exposed port  | `8000`           |

### Example: Running on a different port

```bash
terraform apply -var="external_port=9090"
```

---

## 🧹 Cleanup (Destroy)

To remove all created resources (container and image):

```bash
terraform destroy
```

---

## ⚠️ Common Issues

**Error:**
`Error pinging Docker server: permission denied... /var/run/docker.sock`

**Solution:**
Your user does not have permission to access the Docker socket. On Linux, add your user to the Docker group:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Then retry:

```bash
terraform apply
```

---

---

# Terraform Local Docker Provisioning 🐳 🛠️

Bu proje, herhangi bir Cloud (AWS, Azure vb.) maliyeti olmadan **Infrastructure as Code (IaC)** prensiplerini uygulamalı olarak göstermek amacıyla hazırlanmıştır.

Terraform kullanılarak yerel makinede (Docker Desktop / Docker Engine) çalışan bir Nginx web sunucusu provizyon edilir.

---

## 🎯 Projenin Amacı ve Kazanımlar

Bu repo, aşağıdaki **DevOps ve SRE** yetkinliklerinin pratik uygulamasını içerir:

* **IaC (Infrastructure as Code):** Altyapının manuel komutlarla (`docker run`) değil, deklaratif kod bloklarıyla yönetilmesi.
* **Terraform Kaynak Yönetimi:** `docker_image` ve `docker_container` kaynaklarının tanımlanması.
* **Modüler Yapı:** `variables.tf` ve `outputs.tf` dosyaları ile parametrik ve tekrar kullanılabilir kod yazımı.
* **Volume Mounting:** Yerel dosya sistemindeki kodun (`index.html`) konteyner içine dinamik olarak bağlanması.
* **State Yönetimi:** Terraform state dosyasının mantığı ve yaşam döngüsü.

---

## 📂 Proje Yapısı

```text
.
├── main.tf        # Provider ve resource tanımları (ana konfigürasyon)
├── variables.tf   # Değişken tanımları (portlar, isimler vb.)
├── outputs.tf     # Çıktı değerleri (konteyner ID, URL)
├── index.html     # Nginx içinde sunulacak özel HTML sayfası
└── README.md      # Proje dokümantasyonu
```

---

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler

* [Terraform](https://developer.hashicorp.com/terraform) (CLI yüklü olmalı)
* [Docker](https://www.docker.com/) (Docker Daemon çalışır durumda olmalı)

---

### Adım 1: Projeyi Başlat (Init)

```bash
terraform init
```

---

### Adım 2: Plan Oluştur (Plan)

```bash
terraform plan
```

---

### Adım 3: Uygula (Apply)

```bash
terraform apply
```

---

### Adım 4: Test Et

İşlem tamamlandığında Outputs kısmında belirtilen adrese gidin
(Varsayılan: [http://localhost:8000](http://localhost:8000)).

Tarayıcıda **"Merhaba Dunya!"** (veya `index.html` içeriği) görüntülenmelidir.

---

## ⚙️ Konfigürasyon (Değişkenler)

| Değişken Adı     | Açıklama                  | Varsayılan Değer |
| ---------------- | ------------------------- | ---------------- |
| `container_name` | Docker konteyner adı      | `tutorial_nginx` |
| `image_name`     | Kullanılacak Docker imajı | `nginx:latest`   |
| `internal_port`  | Konteyner içi port        | `80`             |
| `external_port`  | Localhost erişim portu    | `8000`           |

### Örnek: Farklı bir portta çalıştırmak için

```bash
terraform apply -var="external_port=9090"
```

---

## 🧹 Temizlik (Destroy)

```bash
terraform destroy
```

---

## ⚠️ Sık Karşılaşılan Hatalar

**Hata:**
`Error pinging Docker server: permission denied... /var/run/docker.sock`

**Çözüm:**

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Ardından tekrar deneyin:

```bash
terraform apply
```
