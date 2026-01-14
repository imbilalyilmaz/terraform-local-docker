# Terraform Local Docker Provisioning 🐳 🛠️

Bu proje, herhangi bir Cloud (AWS, Azure vb.) maliyeti olmadan, **Infrastructure as Code (IaC)** prensiplerini uygulamalı olarak göstermek amacıyla hazırlanmıştır. 

Terraform kullanılarak yerel makinede (Docker Desktop/Engine) çalışan bir Nginx web sunucusu provizyon edilir.

## 🎯 Projenin Amacı ve Kazanımlar

Bu repo, aşağıdaki DevOps ve SRE yetkinliklerinin pratik uygulamasını içerir:

* **IaC (Infrastructure as Code):** Altyapının manuel komutlarla (`docker run`) değil, deklaratif kod bloklarıyla yönetilmesi.
* **Terraform Kaynak Yönetimi:** `docker_image` ve `docker_container` kaynaklarının tanımlanması.
* **Modüler Yapı:** `variables.tf` ve `outputs.tf` dosyaları ile parametrik ve tekrar kullanılabilir kod yazımı.
* **Volume Mounting:** Yerel dosya sistemindeki kodun (`index.html`) konteyner içine dinamik olarak bağlanması.
* **State Yönetimi:** Terraform'un durum dosyasının (state) mantığı ve yaşam döngüsü.

## 📂 Proje Yapısı

```text
.
├── main.tf        # Provider ve Resource tanımları (Ana konfigürasyon)
├── variables.tf   # Değişken tanımları (Portlar, isimler vb.)
├── outputs.tf     # Çıktı değerleri (Konteyner ID, URL)
├── index.html     # Nginx içinde sunulacak özel HTML sayfası
└── README.md      # Proje dökümantasyonu
```

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler

- [Terraform](https://developer.hashicorp.com/terraform) (CLI yüklü olmalı)

- [Docker](https://www.docker.com/) (Docker Daemon çalışır durumda olmalı)


### Adım 1: Projeyi Başlat (Init)
Terraform'un Docker provider eklentisini indirmesi için:

```bash
terraform init
```

### Adım 2: Planı Oluştur (Plan)
Terraform'un yapacağı değişiklikleri önizlemek için:

```bash
terraform plan
```

### Adım 3: Uygula (Apply)
Altyapıyı oluşturmak için (Onay sorusuna yes yazın):

```bash
terraform apply
```

### Adım 4: Test Et
İşlem tamamlandığında terminalde Outputs kısmında belirtilen adrese gidin (Varsayılan: http://localhost:8000).

Tarayıcıda "Merhaba Dunya!" (veya index.html içindeki içeriği) görmelisiniz.

## ⚙️ Konfigürasyon (Değişkenler)
Bu projeyi variables.tf dosyasını düzenleyerek veya komut satırından parametre geçerek özelleştirebilirsiniz.

| Değişken Adı    | Açıklama                     | Varsayılan Değer |
|-----------------|------------------------------|------------------|
| `container_name` | Docker konteynerinin adı     | `tutorial_nginx` |
| `image_name`     | Kullanılacak Docker imajı    | `nginx:latest`   |
| `internal_port`  | Konteyner içi port           | 80               |
| `external_port`  | Localhost erişim portu       | 8000             |

### Örnek: Farklı bir portta çalıştırmak için:

```bash
terraform apply -var="external_port=9090"
```

## 🧹 Temizlik (Destroy)
Oluşturulan tüm kaynakları (Konteyner ve İmaj) sistemden kaldırmak için:

```bash
terraform destroy
```

## ⚠️ Sık Karşılaşılan Hatalar
Hata: `Error pinging Docker server: permission denied... /var/run/docker.sock`

Çözüm: Kullanıcınızın Docker soketine erişim izni yoktur. Linux kullanıyorsanız şu komutla kullanıcınızı docker grubuna ekleyin:


```bash
sudo usermod -aG docker $USER
newgrp docker
```
Ardından `terraform apply` komutunu tekrar deneyin.






























