### Dosya ve Dizin İşlemleri

1. **Listeleme**:

   ```powershell
   Get-ChildItem
   ```

2. **Mevcut Dizin**:

   ```powershell
   Get-Location
   ```

3. **Dizin Değiştirme**:

   ```powershell
   Set-Location -Path "C:\Path\To\Directory"
   ```

4. **Yeni Dizin Oluşturma**:

   ```powershell
   New-Item -ItemType Directory -Path "C:\Path\To\NewDirectory"
   ```

5. **Yeni Dosya Oluşturma**:

   ```powershell
   New-Item -ItemType File -Path "C:\Path\To\NewFile.txt"
   ```

6. **Dosya Silme**:
   ```powershell
   Remove-Item -Path "C:\Path\To\File.txt"
   ```

### Sistem Bilgileri

7. **Sistem Bilgilerini Görüntüleme**:

   ```powershell
   Get-ComputerInfo
   ```

8. **Yüklü Yazılımları Listeleme**:
   ```powershell
   Get-WmiObject -Class Win32_Product
   ```

### Süreç Yönetimi

9. **Çalışan Süreçleri Listeleme**:

   ```powershell
   Get-Process
   ```

10. **Belirli Bir Süreci Sonlandırma**:

```powershell
Stop-Process -Name "ProcessName"
```

### Hizmet Yönetimi

11. **Hizmetleri Listeleme**:

```powershell
Get-Service
```

12. **Hizmeti Başlatma**:

```powershell
Start-Service -Name "ServiceName"
```

13. **Hizmeti Durdurma**:

```powershell
Stop-Service -Name "ServiceName"
```

### Ağ İşlemleri

14. **Ağ Bağlantılarını Listeleme**:

```powershell
Get-NetAdapter
```

15. **IP Adresini Görüntüleme**:

```powershell
Get-NetIPAddress
```

16. **Ping Atma**:

```powershell
Test-Connection -ComputerName "hostname"
```

### Kullanıcı ve Grup Yönetimi

17. **Kullanıcıları Listeleme**:

```powershell
Get-LocalUser
```

18. **Yeni Kullanıcı Oluşturma**:

```powershell
New-LocalUser -Name "NewUser" -Password (ConvertTo-SecureString "Password" -AsPlainText -Force)
```

19. **Kullanıcıyı Silme**:

```powershell
Remove-LocalUser -Name "UserName"
```

### Ortam Değişkenleri

20. **Ortam Değişkenlerini Listeleme**:

```powershell
Get-ChildItem Env:
```

21. **Ortam Değişkeni Ayarlama**:

```powershell
[System.Environment]::SetEnvironmentVariable('VariableName', 'Value', 'User')
```

### Diğer Faydalı Komutlar

22. **Yardım Almak**:

```powershell
Get-Help CommandName
```

23. **PowerShell Sürümünü Kontrol Etmek**:

```powershell
$PSVersionTable.PSVersion
```

24. **Dosya İçeriğini Görüntüleme**:

```powershell
Get-Content -Path "C:\Path\To\File.txt"
```

25. **Logları Görüntüleme**:

```powershell
Get-EventLog -LogName Application
```
