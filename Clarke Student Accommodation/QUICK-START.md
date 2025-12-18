# ?? Quick Start Guide - Clarke Student Accommodation

## Run the Application

1. **Using Visual Studio:**
   - Press `F5` or click the green "Start" button
   - The app will open in your browser at `https://localhost:5001`

2. **Using Command Line:**
   ```bash
   cd "Clarke Student Accommodation"
   dotnet run
   ```

3. **Using .NET Aspire (recommended):**
   - Right-click on `Clarke Student Accommodation.AppHost`
   - Select "Set as Startup Project"
   - Press `F5`
   - Access the Aspire dashboard to monitor the app

---

## ?? Add Your Photos NOW

**Quick 3-Step Process:**

1. Open this folder in File Explorer:
   ```
   Clarke Student Accommodation\wwwroot\images\accommodation\
   ```

2. Copy your accommodation photos into this folder

3. Refresh the Gallery page - images appear automatically! ?

---

## ?? Update Contact Details in 5 Minutes

### 1. Open `Contact.razor`

### 2. Find and Replace:

**Line 28** - Property Manager:
```razor
<p class="contact-name">Your Name Here</p>
```

**Line 35** - Phone:
```razor
<a href="tel:+27YOURPHONE">+27 XX XXX XXXX</a>
```

**Line 44** - WhatsApp:
```razor
<a href="https://wa.me/27YOURPHONE?text=Hi,%20I'm%20interested%20in%20student%20accommodation" 
```

**Line 55** - Email:
```razor
<a href="mailto:your.email@example.com">your.email@example.com</a>
```

**Lines 65-68** - Address:
```razor
Your Street Name<br />
Your Suburb<br />
Johannesburg, Gauteng<br />
Postal Code
```

---

## ??? Add Google Maps in 2 Minutes

1. Go to https://www.google.com/maps
2. Search your accommodation address
3. Click **Share** ? **Embed a map**
4. Copy the `<iframe>` code
5. Open `Location.razor`
6. Find line 54 (the comment with instructions)
7. Replace the `map-placeholder` div with your iframe

**Done!** ??

---

## ?? Customize Colors (Optional)

To change the blue theme to your brand colors:

1. Open any `.razor.css` file
2. Find and replace these colors:
   - `#1e3c72` - Dark blue
   - `#2a5298` - Medium blue
   - `#4a90e2` - Light blue

Use Find & Replace (`Ctrl+H`) across all CSS files.

---

## ? Pre-Launch Checklist

Before going live, check these:

- [ ] Added accommodation photos to gallery folder
- [ ] Updated phone number in Contact page
- [ ] Updated email address in Contact page
- [ ] Updated WhatsApp link with your number
- [ ] Updated physical address
- [ ] Added Google Maps embed
- [ ] Tested on mobile phone
- [ ] Tested all navigation links
- [ ] Checked all pages load correctly
- [ ] Verified WhatsApp/phone/email links work

---

## ?? Quick Troubleshooting

**Problem:** Build fails
**Solution:** 
```bash
dotnet restore
dotnet clean
dotnet build
```

**Problem:** Gallery shows no images
**Solution:** 
- Images must be in `wwwroot/images/accommodation/`
- Check file extensions (.jpg, .png, etc.)

**Problem:** Changes don't appear
**Solution:**
- Stop the app (`Shift+F5`)
- Rebuild (`Ctrl+Shift+B`)
- Run again (`F5`)

---

## ?? Deploy to Xneelo

```bash
dotnet publish -c Release -o ./publish
```

Upload the contents of the `publish` folder to your hosting via FTP.

---

## ?? Need More Features?

Want to add:
- Online booking system
- Payment integration
- Admin dashboard
- Database for inquiries
- Email notifications

All the code is ready to extend! The architecture supports easy additions.

---

**Your site is ready to go live! Just add photos and update contact info.** ??
