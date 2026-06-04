# Casino Games Portfolio

A GitHub Pages website showcasing my casino game projects hosted on itch.io.

## How to Add a New Game

1. **Get your game's iframe embed code from itch.io:**
   - Go to your game's page on itch.io
   - Click "Edit game"
   - Scroll to "Embed options" and select "Embed game"
   - Copy the entire iframe code snippet

2. **Add the iframe to the games object:**
   
   In `index.html`, find the `<script>` section and add your game:
   ```javascript
   const games = {
       'game1': '<iframe frameborder="0" src="..." ...>...</iframe>',
       'game2': 'YOUR_IFRAME_CODE_HERE'
   };
   ```

3. **Add a game card in `index.html`:**
   
   Copy the game card template in the `<section id="games">` and customize:
   - Replace the thumbnail image URL with your game screenshot
   - Update the game title
   - Change the date
   - Write your description
   - List your game features
   - Update the "Play Game" button onclick to use the correct game ID (e.g., `onclick="openGame('game2')"`)

## Customization Tips

- **Colors**: Edit the gradient colors in `style.css` (search for `linear-gradient`)
- **Font**: Change the font-family in `style.css`
- **Thumbnail images**: Use your game screenshots or create custom thumbnails
- **Header**: Update the title and tagline in `index.html`

## File Structure

```
gh-portfolio/
├── index.html      # Main HTML file
├── style.css       # Styling
├── script.js       # Game embed functionality
└── README.md       # This file
```
