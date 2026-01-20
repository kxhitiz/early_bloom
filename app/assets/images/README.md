# Early Bloom Brand Assets 🌸

This directory contains the official brand assets for Early Bloom.

## Logo Files

### 1. `early_bloom_logo.svg` (200x60px)
**Usage:** Main horizontal logo for headers and navigation
- Full logo with text "Early Bloom" and tagline
- Use in website header
- Use in email signatures
- Best for: Desktop navigation, letterheads

**Colors:**
- Flower petals: Pink/Coral (#fda4af, #f9a8d4)
- Center: Golden yellow (#fbbf24)
- Stem/leaves: Emerald green (#047857, #059669, #10b981)
- Text "Early": Dark emerald (#047857)
- Text "Bloom": Medium emerald (#059669)
- Tagline: Stone gray (#78716c)

### 2. `early_bloom_icon.svg` (48x48px)
**Usage:** Favicon and app icon
- Simplified flower bloom icon
- Square format
- Use as browser favicon
- Use as iOS/Android app icon
- Use as social media profile picture
- Best for: Small sizes, favicons

### 3. `early_bloom_social.svg` (800x400px)
**Usage:** Social media covers and marketing materials
- Large format with decorative elements
- Full logo with background gradient
- Use for: Facebook cover, Twitter header, LinkedIn banner
- Use for: Marketing materials, presentations
- Best for: Social media, print materials

## Color Palette

### Primary Colors
```
Emerald 700: #047857  (Dark - headings, primary text)
Emerald 600: #059669  (Medium - buttons, links, accents)
Emerald 500: #10b981  (Light - hover states)
```

### Secondary Colors
```
Pink 300:    #f9a8d4  (Soft pink - flower petals)
Rose 300:    #fda4af  (Coral - flower petals)
Amber 400:   #fbbf24  (Golden - flower center)
```

### Neutral Colors
```
Stone 50:    #fafaf9  (Background)
Stone 200:   #e7e5e4  (Borders)
Stone 400:   #a8a29e  (Secondary text)
Stone 600:   #57534e  (Body text)
Stone 800:   #292524  (Headings)
```

## Usage Guidelines

### Do's ✅
- Use the SVG format for all web applications (scalable, crisp)
- Maintain aspect ratios when resizing
- Use on white or very light backgrounds
- Ensure adequate padding around the logo (minimum 10px)
- Use the full logo when space permits

### Don'ts ❌
- Don't distort or stretch the logo
- Don't change the colors
- Don't add effects (shadows, glows, etc.)
- Don't use on dark backgrounds without testing
- Don't place on busy or patterned backgrounds
- Don't recreate or modify the flower illustration

## File Formats

All logos are provided in SVG format because:
- **Scalable** - Can be resized to any dimension without quality loss
- **Small file size** - Efficient for web use
- **Crisp rendering** - Looks perfect on all screens (retina, 4K, etc.)
- **Easy to maintain** - Simple XML-based format

## Converting to Other Formats

If you need PNG or other formats:

### Using ImageMagick (command line)
```bash
# Convert to PNG at specific size
convert early_bloom_logo.svg -resize 400x early_bloom_logo.png

# Convert icon to multiple sizes for favicons
convert early_bloom_icon.svg -resize 16x16 favicon-16.png
convert early_bloom_icon.svg -resize 32x32 favicon-32.png
convert early_bloom_icon.svg -resize 192x192 favicon-192.png
convert early_bloom_icon.svg -resize 512x512 favicon-512.png
```

### Using Online Tools
- [Cloudconvert.com](https://cloudconvert.com/svg-to-png)
- [SVG to PNG Converter](https://svgtopng.com/)

### Using Design Software
- Open in Figma/Sketch/Adobe Illustrator
- Export as PNG, JPG, or other formats
- Recommended resolution: 2x or 3x for retina displays

## Logo Variations

### Current Logos
1. **Horizontal Logo** - For headers (200x60)
2. **Icon** - For favicons (48x48)
3. **Social** - For marketing (800x400)

### Future Considerations
- Dark mode version (white/light colors for dark backgrounds)
- Monochrome version (single color for printing)
- Vertical stacked logo (for narrow spaces)
- Animated version (for loading screens)

## Implementation in Rails

```erb
<!-- Header logo -->
<%= image_tag "early_bloom_logo.svg", alt: "Early Bloom", class: "h-10" %>

<!-- Favicon -->
<%= favicon_link_tag "early_bloom_icon.svg", type: "image/svg+xml" %>

<!-- Social media meta tag -->
<meta property="og:image" content="<%= image_url('early_bloom_social.svg') %>">
```

## Brand Voice

When using the logo, remember Early Bloom's brand values:
- **Calm** - Soft colors, gentle shapes
- **Supportive** - Blooming flower represents growth
- **Safe** - Rounded edges, no sharp angles
- **Natural** - Organic flower shape, earthy colors
- **Hopeful** - Upward growth, bright center

## Questions?

For brand guidelines or custom logo variations, contact the development team.

---

**Early Bloom** 🌸  
*A safe space for new parents*
