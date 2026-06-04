# Adding New Games

Each game is stored as a separate HTML file in this directory. To add a new game, just copy an existing file and modify it!

## Quick Start

1. **Copy an existing game file:**
   ```bash
   cp games/lucky-pharoah.html games/my-new-game.html
   ```

2. **Edit the new file** - Update these fields:
   - `<img src="...">` - Path to your game's thumbnail
   - `<h2 class="game-title">` - Game title
   - `<p class="game-date">` - Release date
   - `<p class="game-description">` - Game description
   - `<ul class="game-features">` - Feature list
   - `onclick="openGame('...')">` - Unique game ID

3. **Add to index.html** - Open `/index.html` and add two things:
   
   a) Add your file to the `gameCards` array (around line 55):
   ```javascript
   const gameCards = [
       'games/lucky-pharoah.html',
       'games/my-new-game.html'  // Add this line
   ];
   ```
   
   b) Add your game embed to the `games` object (around line 51):
   ```javascript
   const games = {
       'game1': '<iframe ...></iframe>',
       'game2': '<iframe src="your-game-embed-url"></iframe>'  // Add this
   };
   ```

4. **Test locally** - Run `./start-server.sh` and open http://localhost:8000

That's it! Your new game card will appear on the page.

## File Structure Example

Each game HTML file should look like this:

```html
<article class="game-card">
    <div class="game-thumbnail">
        <img src="img/your-game.png" alt="Your Game Title">
    </div>
    <div class="game-info">
        <h2 class="game-title">Your Game Title</h2>
        <p class="game-date">June 2026</p>
        <p class="game-description">
            Description of your game...
        </p>
        <ul class="game-features">
            <li>Feature 1</li>
            <li>Feature 2</li>
            <li>Feature 3</li>
        </ul>
        <div class="game-links">
            <button class="btn btn-primary" onclick="openGame('game2')">Play Game</button>
        </div>
    </div>
</article>
```
