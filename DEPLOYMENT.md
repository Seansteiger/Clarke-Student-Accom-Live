# Deployment Guide - Clarke Student Accommodation

## 🚨 IMPORTANT: Fix Required First

**⚠️ If deployment is failing, GitHub Pages may not be enabled!**

**👉 [SEE DEPLOYMENT-FIX.md](DEPLOYMENT-FIX.md) for the 2-minute fix 👈**

---

This guide covers how to deploy the Clarke Student Accommodation website to GitHub Pages.

## 🚀 Quick Start

The website is configured to automatically deploy to GitHub Pages when changes are pushed to the `master` branch.

**Deployed URL:** https://seansteiger.github.io/Clarke-Student-Accom-Live/

---

## ⚙️ Prerequisites

### 1. Enable GitHub Pages in Repository Settings

Before the first deployment, you must enable GitHub Pages:

1. Go to your repository on GitHub: https://github.com/Seansteiger/Clarke-Student-Accom-Live
2. Click **Settings** tab
3. Navigate to **Pages** in the left sidebar
4. Under **Source**, select:
   - **Source:** GitHub Actions
5. Save the settings

**Note:** You only need to do this once. The setting persists for all future deployments.

**If you encounter deployment errors, see [DEPLOYMENT-FIX.md](DEPLOYMENT-FIX.md)**

---

## 📦 Deployment Methods

### Method 1: Automatic Deployment (Recommended)

The website automatically deploys when you push changes to the `master` branch:

```bash
# Merge your changes to master
git checkout master
git merge your-feature-branch
git push origin master
```

The GitHub Actions workflow will:
1. Build the Blazor WebAssembly static site
2. Optimize assets
3. Deploy to GitHub Pages
4. Make the site live at https://seansteiger.github.io/Clarke-Student-Accom-Live/

### Method 2: Manual Deployment Trigger

You can manually trigger a deployment without pushing code:

1. Go to **Actions** tab in your repository
2. Select **Deploy to GitHub Pages** workflow
3. Click **Run workflow** button
4. Select the `master` branch
5. Click **Run workflow**

---

## 🔍 Monitoring Deployment

### Check Deployment Status

1. Go to the **Actions** tab: https://github.com/Seansteiger/Clarke-Student-Accommodation/actions
2. Look for the latest "Deploy to GitHub Pages" workflow run
3. Click on it to see detailed logs

### Deployment Steps

The workflow performs these steps:
- ✅ Checkout code
- ✅ Setup .NET 8.0
- ✅ Build Blazor WebAssembly app
- ✅ Create 404.html for SPA routing
- ✅ Upload artifacts to GitHub Pages
- ✅ Deploy to GitHub Pages

**Typical deployment time:** 2-3 minutes

---

## 🛠️ Technical Details

### Project Structure

- **Main Project:** `Clarke Student Accommodation/` (Blazor Server - for local development)
- **Static Project:** `Clarke Student Accommodation.Static/` (Blazor WebAssembly - for GitHub Pages)

### Build Configuration

The static project is configured for GitHub Pages deployment:

**Base Path:** `/Clarke-Student-Accommodation/`
- Configured in `wwwroot/index.html` (line 9)
- Required for GitHub Pages subdirectory deployment

**Jekyll Bypass:** `.nojekyll` file
- Prevents GitHub from processing the site with Jekyll
- Ensures `_framework` folder is served correctly

**SPA Routing:** `404.html`
- Copy of `index.html` for client-side routing
- Allows direct navigation to routes like `/gallery`

### Workflow File

Location: `.github/workflows/gh-pages.yml`

Key features:
- Triggers on push to `master` branch
- Manual dispatch available
- Concurrency control to prevent multiple deployments
- Environment protection with deployment URL

---

## 🐛 Troubleshooting

### Issue: Workflow doesn't run

**Solution:**
1. Check that you pushed to the `master` branch (not another branch)
2. Verify GitHub Pages is enabled in Settings → Pages
3. Check Actions tab for error messages

### Issue: Deployment succeeds but site shows 404

**Solution:**
1. Verify GitHub Pages source is set to "GitHub Actions"
2. Check the base href in `index.html` matches your repository name
3. Wait 1-2 minutes for DNS propagation

### Issue: Site loads but resources are missing (blank page)

**Solution:**
1. Check browser console for errors
2. Verify `.nojekyll` file exists in `wwwroot`
3. Ensure base href is correct: `/Clarke-Student-Accommodation/`
4. Clear browser cache and hard refresh (Ctrl+F5)

### Issue: Changes don't appear after deployment

**Solution:**
1. Clear browser cache (Ctrl+Shift+Delete)
2. Hard refresh the page (Ctrl+F5)
3. Try incognito/private browsing mode
4. Check GitHub Actions to confirm deployment completed successfully

---

## 🔄 Updating the Website

### Adding New Images

1. Add images to `Clarke Student Accommodation.Static/wwwroot/images/`
2. Commit and push to `master`
3. Automatic deployment will include new images

### Modifying Pages

1. Edit Razor components in `Clarke Student Accommodation.Static/Components/Pages/`
2. Test locally: `dotnet run` from the Static project directory
3. Commit and push to `master`
4. Automatic deployment will update the live site

### Updating Contact Information

1. Edit `Clarke Student Accommodation.Static/Components/Pages/Contact.razor`
2. Update phone, email, WhatsApp, or address
3. Commit and push to `master`
4. Changes go live automatically

---

## 🧪 Testing Before Deployment

### Local Testing

Test the static build locally before deploying:

```bash
# Build the static project
cd "Clarke Student Accommodation.Static"
dotnet publish -c Release -o ../output

# Serve the output directory with a local web server
cd ../output/wwwroot
python3 -m http.server 8080

# Open browser to http://localhost:8080/Clarke-Student-Accommodation/
```

**Note:** The base href requires the path `/Clarke-Student-Accommodation/` even locally.

### Pre-Deployment Checklist

Before merging to `master`:

- [ ] Test all pages load correctly
- [ ] Verify navigation works (desktop and mobile)
- [ ] Check images display in gallery
- [ ] Test contact links (phone, email, WhatsApp)
- [ ] Verify responsive design on mobile
- [ ] Check browser console for errors
- [ ] Ensure no sensitive data in code

---

## 📊 Deployment History

View all deployments:
- **Actions tab:** https://github.com/Seansteiger/Clarke-Student-Accommodation/actions
- **Deployments:** https://github.com/Seansteiger/Clarke-Student-Accommodation/deployments

Each deployment shows:
- Commit that triggered it
- Build duration
- Deployment status
- Deployment URL

---

## 🔐 Security Notes

### Permissions

The workflow requires these permissions:
- `contents: read` - Read repository code
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - Generate deployment token

### Environment Protection

The workflow uses the `github-pages` environment, which can have protection rules:
- Required reviewers
- Wait timer
- Deployment branches restriction

Configure in Settings → Environments → github-pages

---

## 🌐 Custom Domain (Optional)

To use a custom domain instead of github.io:

1. Add a `CNAME` file to `wwwroot/` with your domain
2. Update base href in `index.html` to `/`
3. Configure DNS settings with your domain provider
4. Enable HTTPS in GitHub Pages settings

---

## 📝 Additional Resources

- **GitHub Pages Documentation:** https://docs.github.com/en/pages
- **Blazor WebAssembly Documentation:** https://learn.microsoft.com/aspnet/core/blazor
- **GitHub Actions Documentation:** https://docs.github.com/en/actions

---

## 🆘 Getting Help

If you encounter issues:

1. Check the **Actions** tab for detailed error logs
2. Review this troubleshooting guide
3. Verify GitHub Pages settings
4. Check that the workflow file hasn't been modified incorrectly

---

## ✅ Deployment Success

After successful deployment, your website will be live at:
**https://seansteiger.github.io/Clarke-Student-Accommodation/**

Share this URL with students looking for accommodation!

---

**Last Updated:** December 2025  
**Deployment Method:** GitHub Actions + GitHub Pages  
**Technology:** Blazor WebAssembly, .NET 8.0
