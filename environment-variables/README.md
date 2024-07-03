# PowerShell ile Ortam Değişkenlerini Listeleme

Windows PowerShell'de ortam değişkenlerini listelemek ve yönetmek için kullanabileceğiniz çeşitli komutlar vardır. Bu rehberde, bu komutların nasıl kullanılacağını öğreneceksiniz.

## Tüm Ortam Değişkenlerini Listeleme

Tüm ortam değişkenlerini listelemek için `Get-ChildItem` veya kısayol olarak `gci` komutunu kullanabilirsiniz:

```powershell
Get-ChildItem Env:
```

veya

```powershell
gci Env:
```

Bu komut, tüm ortam değişkenlerini ve değerlerini listeler.

## Belirli Bir Ortam Değişkenini Görüntüleme

Belirli bir ortam değişkeninin değerini görüntülemek için `$env:` önekiyle değişken adını kullanabilirsiniz. Örneğin, `PATH` ortam değişkeninin değerini görüntülemek için:

```powershell
$env:PATH
```

## Ortam Değişkenlerini Filtreleme

Belirli bir desene uyan ortam değişkenlerini filtrelemek için `Where-Object` komutunu kullanabilirsiniz. Örneğin, `PATH` içeren tüm değişkenleri listelemek için:

```powershell
Get-ChildItem Env: | Where-Object { $_.Name -like "*PATH*" }
```

## Ortam Değişkenlerini Formatlı Listeleme

Ortam değişkenlerini formatlı olarak listelemek için `Format-Table` veya `Format-List` komutlarını kullanabilirsiniz:

```powershell
Get-ChildItem Env: | Format-Table
```

veya

```powershell
Get-ChildItem Env: | Format-List
```

Bu komutlar, ortam değişkenlerini daha okunabilir bir biçimde görüntülemenize olanak tanır.
