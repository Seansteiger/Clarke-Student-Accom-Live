# Copilot Instructions for Clarke Student Accommodation

## Project Overview

Clarke Student Accommodation is a modern, responsive Blazor Web App for showcasing student accommodation near the University of Johannesburg. The application is designed to be simple, user-friendly, and easily customizable by non-technical users.

### Technology Stack
- **.NET 10** - Target framework
- **Blazor Web App** - Server-side interactive rendering
- **.NET Aspire** - Cloud-native application orchestration
- **Bootstrap Icons** - Icon library (via CDN)
- **No authentication** - Public-facing informational site
- **Entity Framework Core** - Database (currently minimal usage)

### Project Structure
```
Clarke Student Accommodation/           # Main web application
├── Components/
│   ├── Layout/                        # MainLayout with header, nav, footer
│   └── Pages/                         # Home, Gallery, Location, Contact
├── wwwroot/
│   ├── images/accommodation/          # User-uploaded accommodation photos
│   └── app.css                        # Global styles
└── Program.cs                         # Application entry point

Clarke Student Accommodation.Static/    # Static hosting version for GitHub Pages
Clarke Student Accommodation.AppHost/   # .NET Aspire orchestration
Clarke Student Accommodation.ServiceDefaults/ # Shared service configurations
```

## Building and Running

### Development
```bash
# Using .NET CLI
cd "Clarke Student Accommodation"
dotnet restore
dotnet build
dotnet run

# Using .NET Aspire (recommended)
cd "Clarke Student Accommodation.AppHost"
dotnet run
```

### Testing
- No automated test projects currently exist
- Manual testing should focus on:
  - Page navigation and responsiveness
  - Image gallery functionality
  - Contact form display
  - Mobile menu behavior

### Deployment
```bash
# For GitHub Pages (automated via GitHub Actions)
dotnet publish "Clarke Student Accommodation.Static/Clarke Student Accommodation.Static.csproj" -c Release -o output

# For traditional hosting (Xneelo, etc.)
cd "Clarke Student Accommodation"
dotnet publish -c Release -o ./publish
```

## Coding Guidelines

### General Principles
- **Minimal changes only** - This is a simple, working application designed for easy customization
- **Keep it simple** - The target audience includes non-technical users who need to update content
- **Preserve existing patterns** - Follow established conventions in layout, styling, and structure
- **Mobile-first** - All features must work well on mobile devices (students primarily use phones)

### Blazor Component Standards
- Use **isolated CSS files** (`.razor.css`) for component-specific styling
- Follow the **existing naming pattern**: `ComponentName.razor` and `ComponentName.razor.css`
- Server-side rendering with interactive server components
- Use `@rendermode InteractiveServer` when interactivity is needed

### CSS and Styling
- **Color scheme**:
  - Primary: `#1e3c72` (dark navy blue)
  - Secondary: `#2a5298` (medium blue)
  - Accent: `#4a90e2` (bright blue)
  - Text: `#333` (dark gray)
  - Background: `#f8f9fa` (light gray)
- **Responsive breakpoints**:
  - Mobile: < 768px (1 column layouts)
  - Tablet: 768px - 1023px (2 column layouts)
  - Desktop: ≥ 1024px (3 column layouts)
- Use CSS Grid and Flexbox for layouts
- All hover effects should include smooth transitions

### File Naming Conventions
- Projects have spaces in names: `"Clarke Student Accommodation"`
- Use quotes when referencing paths in CLI commands
- CSS classes use kebab-case: `contact-card`, `feature-grid`
- C# follows standard naming: PascalCase for classes/methods, camelCase for variables

### Important Patterns

#### Image Gallery Pattern
- Images are loaded dynamically from `wwwroot/images/accommodation/`
- Supported formats: .jpg, .jpeg, .png, .gif, .webp
- No database or configuration needed - files are auto-discovered
- DO NOT change this pattern - it's a key feature for non-technical users

#### Navigation Pattern
- Desktop: Horizontal navigation in header
- Mobile: Hamburger menu with slide-down
- Footer: Quick links duplicating main navigation
- Maintain this dual-navigation approach

#### Layout Pattern
- All pages use `MainLayout.razor`
- Header is sticky (stays visible on scroll)
- Footer appears on all pages
- Content uses consistent padding and max-width

## Key Constraints

### DO NOT:
- Add authentication/authorization (not required for this project)
- Add complex backend features (keep it simple)
- Remove or modify the dynamic gallery loading mechanism
- Change the project naming convention (spaces are intentional)
- Add dependencies that complicate deployment
- Break mobile responsiveness

### DO:
- Keep changes minimal and focused
- Test on mobile viewports
- Preserve the existing color scheme unless explicitly requested
- Maintain the simple, clean aesthetic
- Follow existing component patterns
- Document any new features in markdown files

## Common Tasks

### Adding a New Page
1. Create `NewPage.razor` in `Components/Pages/`
2. Create `NewPage.razor.css` for styling
3. Add route: `@page "/newpage"`
4. Add navigation link to `MainLayout.razor`
5. Add footer link if appropriate
6. Test mobile navigation

### Modifying Styles
1. Component-specific: Edit the `.razor.css` file
2. Global styles: Edit `wwwroot/app.css`
3. Always test responsive breakpoints
4. Maintain existing color scheme

### Working with Images
- User images: `wwwroot/images/accommodation/`
- Static assets: `wwwroot/images/`
- Images are served from `MapStaticAssets()`
- Gallery auto-discovers files - no registration needed

## Deployment Targets

### GitHub Pages (Primary)
- Automated via `.github/workflows/gh-pages.yml`
- Deploys on push to `master` branch
- Uses `Clarke Student Accommodation.Static` project
- Special handling for Blazor WebAssembly artifacts
- Live at: https://seansteiger.github.io/Clarke-Student-Accommodation/

### Traditional Hosting (Xneelo, etc.)
- Requires .NET 10 Runtime or self-contained deployment
- FTP upload of published files
- Reverse proxy configuration (Nginx/IIS)

## South African Context

### Important Considerations
- Target audience: South African university students
- Location: University of Johannesburg area
- WhatsApp is the primary communication channel (not SMS)
- Phone numbers use +27 format
- Currency references should use ZAR/Rands
- Mobile data is expensive - optimize for performance

### Contact Methods Priority
1. WhatsApp (most popular)
2. Phone calls
3. Email
4. In-person viewing

## Documentation

### Existing Documentation
- `README.md` - Repository overview and deployment info
- `QUICK-START.md` - User guide for content updates
- `README-IMPLEMENTATION.md` - Technical implementation details
- `UPDATES-SUMMARY.md` - Change history

### When Making Changes
- Update relevant markdown files if functionality changes
- Keep QUICK-START.md simple for non-technical users
- Document breaking changes in commit messages
- Preserve the step-by-step format in guides

## Version Control

### Branch Strategy
- `master` - Production branch (auto-deploys to GitHub Pages)
- Feature branches: Use descriptive names (`feature/add-booking-form`)
- Copilot branches: Use `copilot/` prefix

### Commit Messages
- Use conventional commit format when appropriate
- Be descriptive about what changed and why
- Reference issue numbers if applicable

## Performance Considerations

- Keep bundle sizes small (mobile data costs)
- Optimize images before uploading (user responsibility, but provide guidance)
- Minimize JavaScript (primarily server-rendered)
- Use lazy loading for images in gallery
- Static assets are fingerprinted and cached

## Accessibility

- Maintain semantic HTML structure
- Include alt text for images (especially gallery)
- Ensure sufficient color contrast
- Test keyboard navigation
- Support screen readers where applicable

## Future Enhancement Areas

Potential areas for expansion (not currently required):
- Online booking system
- Payment integration
- Admin dashboard for content management
- Database for inquiries
- Email notification system
- Testimonials/reviews section
- FAQ page
- Pricing calculator

When implementing these, maintain the simplicity principle and mobile-first approach.
