# Casino Games Portfolio

A GitHub Pages website showcasing my casino game projects hosted on itch.io.

## How to Add a New Game

### 1. Get the correct embed code from itch.io

**IMPORTANT:** Always get fresh embed codes from itch.io. Embed IDs change when you re-upload games!

**Method 1 - From the published game page (RECOMMENDED):**
   - Visit your game's public page on itch.io (e.g., `https://solcalc.itch.io/your-game`)
   - Click **"Embed"** at the bottom of the page
   - Copy the iframe code that itch.io provides

**Method 2 - From the game dashboard:**
   - Go to your game's dashboard on itch.io
   - Click "Edit game"
   - Scroll to "Embed options" 
   - Copy the embed code

**⚠️ Common Issues:**
- If the embed "hangs" or doesn't load, the embed ID is likely outdated
- Re-uploading a game creates a NEW embed ID - you must update your code
- Test the embed URL directly in your browser: `https://itch.io/embed-upload/YOUR_ID?color=333333`

### 2. Create a game card HTML file

Create a new file in the `games/` folder (e.g., `games/my-new-game.html`):

```html
<article class="game-card">
    <div class="game-thumbnail">
        <img src="img/my-game-thumbnail.png" alt="My Game Title">
    </div>
    <div class="game-info">
        <h2 class="game-title">My Game Title</h2>
        <p class="game-date">June 2026</p>
        <p class="game-description">
            A brief description of your game that explains the concept.
        </p>
        <ul class="game-features">
            <li>Feature one of your game</li>
            <li>Feature two of your game</li>
            <li>Feature three of your game</li>
        </ul>
        <div class="game-links">
            <button class="btn btn-primary" onclick="openGame('game3')">Play Game</button>
        </div>
    </div>
</article>
```

**⚠️ CRITICAL:** The game ID in `onclick="openGame('gameX')"` must match the ID you'll use in step 3!

### 3. Add the embed code to index.html

In `index.html`, find the `games` object and add your new game:

```javascript
const games = {
    'game1': '<iframe frameborder="0" src="https://itch.io/embed-upload/17804444?color=333333" allowfullscreen allow="autoplay; fullscreen; payment; pointer-lock" width="470" height="772"><a href="https://solcalc.itch.io/game1">Play Game 1 on itch.io</a></iframe>',
    'game2': '<iframe frameborder="0" src="https://itch.io/embed-upload/17805863?color=333333" allowfullscreen allow="autoplay; fullscreen; payment; pointer-lock" width="470" height="772"><a href="https://solcalc.itch.io/game2">Play Game 2 on itch.io</a></iframe>',
    'game3': 'YOUR_IFRAME_CODE_HERE'  // Add your new game here
};
```

**⚠️ Required customization to the default itch.io embed code:**

The default itch.io embed code only includes `allowfullscreen=""`. You must also add the `allow` attribute for audio, fullscreen, and pointer lock to work correctly in modern browsers:

| Default itch.io code | What to use here |
|---|---|
| `allowfullscreen=""` | `allowfullscreen allow="autoplay; fullscreen; payment; pointer-lock"` |

Full example — change this default:
```html
<iframe frameborder="0" src="https://itch.io/embed-upload/ID?color=333333" allowfullscreen="" width="470" height="772">...</iframe>
```
To this:
```html
<iframe frameborder="0" src="https://itch.io/embed-upload/ID?color=333333" allowfullscreen allow="autoplay; fullscreen; payment; pointer-lock" width="470" height="772">...</iframe>
```

The `allow` attribute is required for:
- `autoplay` — game audio plays without user interaction
- `fullscreen` — fullscreen mode works in all browsers
- `pointer-lock` — mouse cursor can be locked to the game canvas
- `payment` — itch.io payment flows (if used)

### 4. Register the game card in index.html

In `index.html`, find the `gameCards` array and add your new game card file:

```javascript
const gameCards = [
    'games/lucky-pharoah.html',
    'games/triple-rocket-pots.html',
    'games/my-new-game.html'  // Add your new game card here
];
```

### 5. Add a thumbnail image

Place your game's thumbnail image in the `img/` folder with a descriptive name (e.g., `img/my-new-game.png`).

## Game ID Checklist

Before committing, verify:
- [ ] Game ID in the game card HTML (`onclick="openGame('gameX')"`) 
- [ ] Matches the ID in the `games` object in `index.html`
- [ ] Game card file is listed in the `gameCards` array
- [ ] Embed URL is current (from itch.io's embed page)
- [ ] Thumbnail image exists in `img/` folder

## Troubleshooting

**Game hangs/won't load:**
1. Check if the embed ID is correct - visit `https://itch.io/embed-upload/YOUR_ID?color=333333` directly
2. If you re-uploaded the game, get a fresh embed code from itch.io
3. Verify the game ID in your HTML matches the ID in the `games` object

**Wrong game loads:**
- Check that the `onclick="openGame('gameX')"` ID matches the key in the `games` object

**Game card doesn't appear:**
- Verify the card file is listed in the `gameCards` array in `index.html`
- Check the file path is correct

## File Structure

```
gh-portfolio/
├── index.html              # Main HTML file with games object and gameCards array
├── style.css               # Styling
├── about.html              # About page
├── games/                  # Game card HTML files
│   ├── lucky-pharoah.html
│   ├── triple-rocket-pots.html
│   └── your-game.html
├── img/                    # Game thumbnails
│   ├── lucky-pharoah.png
│   ├── triple-rocket-pots.jpeg
│   └── your-game.png
└── README.md               # This file
```

## Customization Tips

- **Colors**: Edit the gradient colors in `style.css` (search for `linear-gradient`)
- **Font**: Change the font-family in `style.css`
- **Thumbnail images**: Use your game screenshots or create custom thumbnails
- **Header**: Update the title and tagline in `index.html`
