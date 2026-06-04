# Local Testing Instructions

You need to run a local web server to test your site because the game cards are loaded using `fetch()`, which doesn't work with the `file://` protocol.

## Easy Method (Recommended)

Just run the included script:

```bash
./start-server.sh
```

Then open http://localhost:8000 in your browser.

Press `Ctrl+C` to stop the server.

## Alternative Methods

### Using Python (if you have it installed):
```bash
python3 -m http.server 8000
# or
python -m http.server 8000
```

### Using Node.js:
```bash
npx http-server -p 8000
```

### Using PHP:
```bash
php -S localhost:8000
```

## Testing on GitHub Pages

Once you push to GitHub, your site will automatically work at:
`https://your-username.github.io/your-repo-name/`

No server needed - GitHub Pages handles everything!
