# 📸 İlan Analiz — Ekran Görüntüsü Okuyucu

Gayrimenkul ilanı ekran görüntülerini (sahibinden / emlakjet vb.) yüklersiniz;
uygulama görüntüdeki yazıları okuyup (OCR) ilan alanlarını çıkarır ve sırayla
tablonuza ekler. Her gün yeni fotoğraf ekledikçe verileriniz birikir.

## 🚀 Çalıştırma (1 tık)

1. `ilan-analiz` klasörüne girin.
2. **`baslat.command`** dosyasına çift tıklayın.
3. Tarayıcı otomatik açılır → uygulama hazır.

> Çift tıklayınca "bilinmeyen geliştirici" uyarısı alırsanız: dosyaya **Sağ Tık → Aç** yapın.

İlk çalıştırmada tarayıcı OCR dil verisini (Türkçe) indirir; bu yüzden ilk açılış
birkaç saniye sürebilir ve internet gerekir. Sonrasında tamamen çevrimdışı çalışır
(ayrıca `vendor/` klasörü zaten yerel olarak hazır).

## 🖼️ Kullanım

1. Ekran görüntülerini **sürükle-bırak** yapın, tıklayıp seçin ya da **⌘/Ctrl+V** ile yapıştırın.
2. Uygulama her fotoğrafı sırayla okur; okunan ilan yanındaki küçük resmi ve
   alanları ile birlikte **kontrol ekranında** açılır.
3. Yanlış/eksik alanı düzeltin → **✅ Ekle** deyin. Böylece tabloya bir satır eklenir.
   Atlamak isterseniz **⏭️ Atla**.
4. Aynı anda birden fazla fotoğraf yükleyebilirsiniz; hepsi sırayla hazırlanır.

OCR yanlış okuduğunda: **Ham metin** ile neyin okunduğunu görebilir, elle düzeltebilir
veya fotoğrafı **Tekrar Dene**'ye basabilirsiniz. OCR hiç çalışmasa:
**📄 Metin Yapıştır** ile ilan metnini elle yapıştırıp çözümleyebilirsiniz.

## 💾 Verilerinizi koruma

- Veriler tarayıcınızda (IndexedDB) otomatik saklanır; sayfayı kapatsanız da kalır.
- **📁 Klasör Seç**: Bir klasör seçersiniz; uygulama her değişiklikte oraya
  `ilanlar.json` ve `ilanlar.csv` yazar. Böylece veriler bilgisayarınızda da birikir.
  > Bu özellik yalnızca **Chrome / Edge** destekler (Apple'ın File System Access API).
- **📥 CSV / JSON**: İstediğiniz zaman dışa aktarabilirsiniz.
- **📤 İçe Aktar**: Daha önce kaydedilmiş JSON/CSV dosyasını geri yükleyebilirsiniz
  (aynı ilan no tekrar eklenmez).

CSV sütunları mevcut `emlak-takip/emlak_takip.csv` ile uyumludur
(İlan Başlığı, İl, İlçe, Mahalle, Fiyat (₺), m² Brüt/Net, Oda Sayısı, …).

## 📁 Klasör yapısı

```
ilan-analiz/
├─ index.html                     ← uygulama (tarayıcıda açılacak dosya)
├─ baslat.command                 ← çift tıkla başlat
├─ vendor/
│  ├─ tesseract.min.js            ← OCR motoru
│  ├─ worker.min.js               ← OCR çalışanı (worker)
│  ├─ tesseract-core-simd-lstm.wasm.js
│  ├─ tesseract-core-lstm.wasm.js
│  └─ tur.traineddata.gz          ← Türkçe dil verisi
└─ README.md
```

## 🔧 Sorun giderme

- **OCR çalışmıyor / boş geliyor:** Uygulamanın `file://` ile değil, `http://localhost`
  üzerinden açıldığından emin olun (`baslat.command` bunu sağlar). Görseli iyileştir
  seçeneğini (`Görseli iyileştir`) açıp deneyin.
- **Klasör yazma yok:** Safari kullanıyorsanız bu özellik yoktur; CSV/JSON indirip
  elle kaydedin.
- **İlk açılış yavaş:** Dil verisi indiriliyor; birkaç saniye bekleyin.

## 📝 Not

OCR (Tesseract) Türkçe için %100 kusursuz değildir; özellikle fiyat, ilan no ve telefon
gibi sayısal alanları her seferinde kontrol edin. Uygulama okunan değerleri düzenlemeniz
için hazır halde sunar.
