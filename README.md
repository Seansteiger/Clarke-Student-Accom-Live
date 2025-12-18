# Clarke Student Accommodation

This project is a Blazor WebAssembly application for student accommodation near the University of Johannesburg.

## 🚨 DEPLOYMENT FIX REQUIRED

**⚠️ The site is currently NOT deployed because GitHub Pages is not enabled.**

**👉 [READ THIS FIRST: DEPLOYMENT-FIX.md](DEPLOYMENT-FIX.md) 👈**

This is a 2-minute fix - you just need to enable GitHub Pages in repository settings!

## 🌐 Live Website (After Fix)

**Website URL:** https://seansteiger.github.io/Clarke-Student-Accom-Live/

## 🚀 Deployment

This project is configured to automatically deploy to GitHub Pages via GitHub Actions.

**The site automatically detects its deployment path** - it works on GitHub Pages, local testing, and other hosting platforms without configuration changes.

### Quick Deployment Steps:

1. **Enable GitHub Pages** (first time only):
   - Go to repository Settings → Pages
   - Set Source to "GitHub Actions"

2. **Deploy the website**:
   - Push changes to the `master` branch, or
   - Manually trigger deployment from the [Actions tab](https://github.com/Seansteiger/Clarke-Student-Accom-Live/actions)

3. **Monitor deployment**:
   - Check the [Actions tab](https://github.com/Seansteiger/Clarke-Student-Accom-Live/actions) for deployment status
   - Deployment typically takes 2-3 minutes

### Detailed Deployment Guide

See [DEPLOYMENT.md](DEPLOYMENT.md) for comprehensive deployment instructions, troubleshooting, and advanced configuration options.

## 📂 Project Structure

- **Clarke Student Accommodation/** - Main Blazor Server application (for local development)
- **Clarke Student Accommodation.Static/** - Blazor WebAssembly static site (for GitHub Pages deployment)
- **Clarke Student Accommodation.AppHost/** - .NET Aspire orchestration

## 🛠️ Local Development

```bash
# Run the static project locally
cd "Clarke Student Accommodation.Static"
dotnet run
```

For more detailed instructions, see the [QUICK-START.md](Clarke%20Student%20Accommodation/QUICK-START.md) guide.
