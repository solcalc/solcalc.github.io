# Portfolio Redesign Implementation Plan

> **For agentic workers:** Use `superpowers:subagent-driven-development` or `superpowers:executing-plans` to implement this plan task-by-task.

**Goal:** Restyle the casino game portfolio with a charcoal + white technical builder aesthetic using Barlow Condensed and Inter typefaces.

**Architecture:** Replace `style.css` wholesale with a CSS custom property token system; update `index.html` nav and hero markup; replace bullet-point feature lists in all 11 `games/*.html` card files with a mechanic tag system; restyle `about.html` inline styles to match the new type system.

**Tech Stack:** Plain HTML/CSS, Google Fonts (Barlow Condensed + Inter), no JS changes.

**Dev server:** Run `./start-server.sh` from the project root; site at http://localhost:8000.

---

## File Map

| File | Action | What changes |
|---|---|---|
| `style.css` | Replace entirely | New token system, typography, all component styles |
| `index.html` | Modify | `<head>` font links, nav markup, hero markup, main/section wrapper |
| `games/3x-pot-casino-frenzy.html` | Replace | New card structure with tags |
| `games/lucky-pharoah.html` | Replace | New card structure with tags |
| `games/triple-mummy-money-pots.html` | Replace | New card structure with tags |
| `games/triple-emperor-pots.html` | Replace | New card structure with tags |
| `games/triple-rocket-pots.html` | Replace | New card structure with tags |
| `games/field-goal-kicker.html` | Replace | New card structure with tags |
| `games/slugfest.html` | Replace | New card structure with tags |
| `games/multiplayer-video-poker.html` | Replace | New card structure with tags |
| `games/magic-card-blackjack.html` | Replace | New card structure with tags |
| `games/magikarp-escape.html` | Replace | New card structure with tags |
| `games/anubis.html` | Replace | New card structure with tags |
| `about.html` | Modify | Inline styles updated to match new type system |

---

## Task 1: Replace style.css

Replace the entire contents of `style.css` with the following. This establishes the full token system, typography, and every component style needed by Tasks 2–4.

```css
@import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Inter:wght@400;500;600&display=swap');

:root {
    --bg:            #111214;
    --surface:       #18191C;
    --border:        rgba(255,255,255,0.08);
    --border-strong: rgba(255,255,255,0.15);
    --text:          #ffffff;
    --text-mid:      rgba(255,255,255,0.50);
    --text-dim:      rgba(255,255,255,0.25);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    background: var(--bg);
    color: var(--text);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    padding-top: 56px;
}

/* ── NAV ── */
.top-nav {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: var(--bg);
    border-bottom: 1px solid var(--border);
    z-index: 100;
    height: 56px;
}

.nav-content {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 2.5rem;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.nav-logo {
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 700;
    font-size: 1rem;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: var(--text-dim);
}

.nav-links {
    display: flex;
    gap: 0.5rem;
}

.nav-btn {
    font-family: 'Inter', sans-serif;
    font-size: 0.7rem;
    font-weight: 600;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    color: var(--text-mid);
    text-decoration: none;
    padding: 0.4rem 0.9rem;
    border: 1px solid var(--border);
    background: none;
    cursor: pointer;
    transition: border-color 0.15s, color 0.15s;
    white-space: nowrap;
}

.nav-btn:hover {
    border-color: var(--border-strong);
    color: var(--text);
}

/* ── HERO ── */
.hero {
    max-width: 900px;
    margin: 0 auto;
    padding: 5rem 2.5rem 4rem;
    border-bottom: 1px solid var(--border);
}

.hero-label {
    font-size: 0.65rem;
    font-weight: 600;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--text-dim);
    margin-bottom: 1rem;
}

.hero-name {
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 800;
    font-size: clamp(3.5rem, 8vw, 6rem);
    line-height: 0.92;
    text-transform: uppercase;
    letter-spacing: -0.01em;
    color: var(--text);
    margin-bottom: 1.5rem;
}

.hero-rule {
    width: 40px;
    height: 2px;
    background: var(--text);
    margin-bottom: 1.5rem;
}

.hero-tagline {
    font-size: 0.95rem;
    color: var(--text-mid);
    max-width: 480px;
    line-height: 1.65;
    margin-bottom: 2.5rem;
}

.hero-stats {
    display: flex;
    gap: 2.5rem;
}

.stat-num {
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 800;
    font-size: 2rem;
    line-height: 1;
    color: var(--text);
}

.stat-label {
    font-size: 0.6rem;
    font-weight: 500;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: var(--text-dim);
    margin-top: 0.25rem;
}

/* ── GAME LIST ── */
.games-container {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 2.5rem 4rem;
}

.games-header {
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    padding: 1.75rem 0 0.75rem;
    border-bottom: 1px solid var(--border);
}

.games-label {
    font-size: 0.6rem;
    font-weight: 600;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--text-dim);
}

.games-count {
    font-size: 0.6rem;
    color: var(--text-dim);
}

#games {
    display: flex;
    flex-direction: column;
}

/* ── GAME CARD ── */
.game-card {
    display: grid;
    grid-template-columns: 260px 1fr;
    border-bottom: 1px solid var(--border);
    transition: background 0.15s;
}

.game-card:hover {
    background: var(--surface);
}

.game-thumb {
    border-right: 1px solid var(--border);
    padding: 1.25rem 1.25rem 1.25rem 0;
    display: flex;
    align-items: center;
    transition: border-color 0.15s;
}

.game-card:hover .game-thumb {
    border-right-color: var(--border-strong);
}

.game-thumb img {
    width: 100%;
    aspect-ratio: 4 / 3;
    object-fit: cover;
    display: block;
    transition: filter 0.15s;
}

.game-card:hover .game-thumb img {
    filter: brightness(1.1);
}

.game-info {
    padding: 1.5rem 0 1.5rem 1.75rem;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 0.5rem;
}

.game-index {
    font-size: 0.65rem;
    font-weight: 500;
    letter-spacing: 0.06em;
    color: var(--text-dim);
}

.game-title {
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 800;
    font-size: 1.4rem;
    line-height: 1.1;
    letter-spacing: 0.01em;
    text-transform: uppercase;
    color: var(--text);
}

.game-desc {
    font-size: 0.8rem;
    color: var(--text-mid);
    line-height: 1.6;
}

.game-tags {
    display: flex;
    gap: 0.4rem;
    flex-wrap: wrap;
}

.tag {
    font-size: 0.55rem;
    font-weight: 600;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: var(--text-dim);
    border: 1px solid var(--border);
    padding: 2px 7px;
}

.game-actions {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 0.25rem;
}

.play-btn {
    font-family: 'Inter', sans-serif;
    font-size: 0.65rem;
    font-weight: 600;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--bg);
    background: var(--text);
    border: none;
    padding: 0.45rem 1rem;
    cursor: pointer;
    transition: opacity 0.15s;
}

.play-btn:hover {
    opacity: 0.85;
}

.game-date {
    font-size: 0.6rem;
    color: var(--text-dim);
}

/* ── MODAL ── */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.95);
    animation: fadeIn 0.2s ease;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to   { opacity: 1; }
}

.modal-content {
    position: relative;
    margin: 3% auto;
    width: fit-content;
    max-width: 95%;
    background: var(--surface);
    padding: 20px;
    border: 1px solid var(--border);
}

.close {
    position: absolute;
    top: -15px;
    right: -15px;
    color: var(--text);
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
    z-index: 1001;
    background: var(--bg);
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: 1;
    border: 1px solid var(--border);
    transition: border-color 0.15s;
}

.close:hover {
    border-color: var(--border-strong);
}

#gameContainer {
    display: flex;
    justify-content: center;
    align-items: center;
}

#gameContainer iframe {
    display: block;
}

.game-iframe-wrapper {
    display: block;
}

/* ── FOOTER ── */
footer {
    border-top: 1px solid var(--border);
    padding: 1.5rem 2.5rem;
    text-align: center;
    color: var(--text-dim);
    font-size: 0.75rem;
}

/* ── RESPONSIVE ── */
@media (max-width: 768px) {
    body { padding-top: 52px; }

    .nav-content { padding: 0 1rem; }

    .hero { padding: 3rem 1rem 2.5rem; }

    .games-container { padding: 0 1rem 3rem; }

    .game-card { grid-template-columns: 1fr; }

    .game-thumb {
        border-right: none;
        border-bottom: 1px solid var(--border);
        padding: 1rem 1rem 0;
    }

    .game-info { padding: 1rem; }

    .modal-content {
        margin: 1% auto;
        padding: 12px;
    }
}
```

**Verify:** Run `./start-server.sh`, open http://localhost:8000. The page will have broken markup at this point (old nav/hero HTML, old card HTML) but fonts should load and the background should be `#111214`. That's expected — Tasks 2 and 3 fix the markup.

**Commit:**
```bash
git add style.css
git commit -m "Replace CSS with charcoal+white token system and Barlow/Inter typography"
```

---

## Task 2: Update index.html markup

Replace the `<head>`, `<nav>`, `<header>`, `<main>`, and `<footer>` sections in `index.html`. Leave the entire `<script>` block untouched.

**2a — Update `<head>`:** Replace the existing head with:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mason McElroy — Game Design Portfolio</title>
    <link rel="stylesheet" href="style.css">
</head>
```

(Google Fonts are loaded via `@import` in `style.css` — no separate link tag needed.)

**2b — Replace `<nav>`:** Replace the existing nav block with:

```html
<nav class="top-nav">
    <div class="nav-content">
        <span class="nav-logo">Solcalc</span>
        <div class="nav-links">
            <button class="nav-btn" onclick="openAbout()">About</button>
            <a href="https://www.linkedin.com/in/mason-mcelroy/" target="_blank" class="nav-btn">LinkedIn ↗</a>
        </div>
    </div>
</nav>
```

**2c — Replace `<header>`:** Replace the existing header block with:

```html
<header class="hero">
    <div class="hero-label">Prototype Portfolio</div>
    <h1 class="hero-name">Mason<br>McElroy</h1>
    <div class="hero-rule"></div>
    <p class="hero-tagline">Casino game designer and mathematician. I design the mechanics, model the math, and build working playable prototypes. All three.</p>
    <div class="hero-stats">
        <div class="stat">
            <div class="stat-num">11</div>
            <div class="stat-label">Playable Prototypes</div>
        </div>
        <div class="stat">
            <div class="stat-num">10+</div>
            <div class="stat-label">Years Experience</div>
        </div>
        <div class="stat">
            <div class="stat-num">Real</div>
            <div class="stat-label">Game Math</div>
        </div>
    </div>
</header>
```

**2d — Replace `<main>`:** Replace the existing main block with:

```html
<main>
    <div class="games-container">
        <div class="games-header">
            <span class="games-label">Prototype Collection</span>
            <span class="games-count">11 games</span>
        </div>
        <section id="games">
            <!-- Game cards loaded dynamically -->
        </section>
    </div>
</main>
```

**2e — Replace `<footer>`:** Replace the existing footer block with:

```html
<footer>
    <p>&copy; 2026 Solcalc Consulting Inc. All rights reserved.</p>
</footer>
```

**Verify:** Reload http://localhost:8000. Hero should show large "MASON / McELROY" in Barlow Condensed, stats row visible, nav shows "Solcalc" on the left. Game cards still look broken (old card HTML) — that's fixed in Task 3.

**Commit:**
```bash
git add index.html
git commit -m "Update index.html nav, hero, and main structure for redesign"
```

---

## Task 3: Update game card HTML files

Replace each `games/*.html` file with the new card structure. The key changes per file: `game-thumbnail` → `game-thumb`; feature bullet list → `.game-tags`; add `.game-index`; `btn btn-primary` → `play-btn`; wrap button in `.game-actions`.

**`games/3x-pot-casino-frenzy.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/3x-pot-casino-frenzy.jpeg" alt="3x Pot Casino Frenzy">
    </div>
    <div class="game-info">
        <div class="game-index">001 · June 2026</div>
        <h2 class="game-title">3x Pot Casino Frenzy: Community Edition</h2>
        <p class="game-desc">Cooperate and compete with 7 other players for a share of the prize pool. More players mean more chances to trigger the community bonus — but a smaller share of the winnings.</p>
        <div class="game-tags">
            <span class="tag">Slot</span>
            <span class="tag">Community Bonus</span>
            <span class="tag">Hold &amp; Spin</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('3x-pot-casino-frenzy')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/lucky-pharoah.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/lucky-pharoah.png" alt="Lucky Pharoah's 3x3 Cluster Collect">
    </div>
    <div class="game-info">
        <div class="game-index">002 · June 2026</div>
        <h2 class="game-title">Lucky Pharoah's 3×3 Cluster Collect</h2>
        <p class="game-desc">A 3×3 board using cluster pays — a rare mechanic in video slots. Nine individually spinning reels with a center-reel collect trigger and an infinite hold & spin.</p>
        <div class="game-tags">
            <span class="tag">Slot</span>
            <span class="tag">Cluster Pays</span>
            <span class="tag">Hold &amp; Spin</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('lucky-pharoah')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/triple-mummy-money-pots.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/triple-mummy-money-pots.jpeg" alt="Triple Mummy Money Pots">
    </div>
    <div class="game-info">
        <div class="game-index">003 · April 2026</div>
        <h2 class="game-title">Triple Mummy Money Pots</h2>
        <p class="game-desc">Third game in the Triple X Pots series. Free spins feature with three possible modifiers — extra spins, random multiplier, or wild collect.</p>
        <div class="game-tags">
            <span class="tag">Slot</span>
            <span class="tag">Hold &amp; Spin</span>
            <span class="tag">Free Spins</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('triple-mummy-money-pots')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/triple-emperor-pots.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/triple-emperor-pots.jpeg" alt="Triple Emperor Pots">
    </div>
    <div class="game-info">
        <div class="game-index">004 · February 2026</div>
        <h2 class="game-title">Triple Emperor Pots</h2>
        <p class="game-desc">Second game in the Triple X Pots series. Free spins rotate in giant symbols alongside extra spins and random multiplier modifiers.</p>
        <div class="game-tags">
            <span class="tag">Slot</span>
            <span class="tag">Hold &amp; Spin</span>
            <span class="tag">Free Spins</span>
            <span class="tag">Giant Symbols</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('triple-emperor-pots')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/triple-rocket-pots.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/triple-rocket-pots.jpeg" alt="Triple Rocket Pots">
    </div>
    <div class="game-info">
        <div class="game-index">005 · January 2026</div>
        <h2 class="game-title">Triple Rocket Pots</h2>
        <p class="game-desc">First game in the Triple X Pots series, built on a custom slot prototyping engine. Free spins with expanding wilds, random multipliers, or extra spins.</p>
        <div class="game-tags">
            <span class="tag">Slot</span>
            <span class="tag">Hold &amp; Spin</span>
            <span class="tag">Free Spins</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('triple-rocket-pots')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/field-goal-kicker.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/field-goal-kicker.jpeg" alt="Field Goal Kicker">
    </div>
    <div class="game-info">
        <div class="game-index">006 · February 2025</div>
        <h2 class="game-title">Field Goal Kicker</h2>
        <p class="game-desc">A retro-style arcade casino game. Pick a distance from the goal — start on any yard line from 1 to 100. Farther completions mean bigger wins.</p>
        <div class="game-tags">
            <span class="tag">Arcade</span>
            <span class="tag">Skill</span>
            <span class="tag">Sports</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('field-goal-kicker')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/slugfest.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/slugfest.jpeg" alt="Slugfest">
    </div>
    <div class="game-info">
        <div class="game-index">007 · August 2024</div>
        <h2 class="game-title">Slugfest</h2>
        <p class="game-desc">Move your strike zone and hit the ball to win. Direct hits mean bigger payouts. Choose from three batters, each with a different volatility profile.</p>
        <div class="game-tags">
            <span class="tag">Arcade</span>
            <span class="tag">Skill</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('slugfest')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/multiplayer-video-poker.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/multiplayer-video-poker.jpeg" alt="Multiplayer Video Poker">
    </div>
    <div class="game-info">
        <div class="game-index">008 · May 2024</div>
        <h2 class="game-title">Multiplayer Video Poker</h2>
        <p class="game-desc">Play video poker against another player. Both players receive the same starting hand — draw cards are randomized independently. High score after 10 rounds wins a bonus prize.</p>
        <div class="game-tags">
            <span class="tag">Video Poker</span>
            <span class="tag">Multiplayer</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('multiplayer-video-poker')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/magic-card-blackjack.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/magic-card-blackjack.jpeg" alt="Magic Card Blackjack">
    </div>
    <div class="game-info">
        <div class="game-index">009 · March 2024</div>
        <h2 class="game-title">Magic Card Blackjack</h2>
        <p class="game-desc">An ante bet layered on top of standard blackjack. The first two cards dealt have a chance to be magic, awarding up to a 100× combined multiplier on wins.</p>
        <div class="game-tags">
            <span class="tag">Blackjack</span>
            <span class="tag">Ante Bet</span>
            <span class="tag">Multipliers</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('magic-card-blackjack')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/magikarp-escape.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/magikarp-escape.jpeg" alt="Magikarp Escape">
    </div>
    <div class="game-info">
        <div class="game-index">010 · February 2023</div>
        <h2 class="game-title">Magikarp Escape</h2>
        <p class="game-desc">Push your luck or cash out as you guide Magikarp through a series of randomly generated obstacles. Each obstacle cleared increases your prize — but one wrong move ends it.</p>
        <div class="game-tags">
            <span class="tag">Arcade</span>
            <span class="tag">Push Your Luck</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('magikarp-escape')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**`games/anubis.html`**

```html
<article class="game-card">
    <div class="game-thumb">
        <img src="img/anubis.jpeg" alt="Anubis">
    </div>
    <div class="game-info">
        <div class="game-index">011 · October 2022</div>
        <h2 class="game-title">Anubis</h2>
        <p class="game-desc">One of the earliest prototypes — a competitive response to the Lucky Tap game category. Tap the jar to win a prize. Multipliers stick for 5 wagers. Grand jackpot worth 25,000×.</p>
        <div class="game-tags">
            <span class="tag">Tap Game</span>
            <span class="tag">Jackpots</span>
            <span class="tag">Multipliers</span>
        </div>
        <div class="game-actions">
            <button class="play-btn" onclick="openGame('anubis')">Play Game</button>
            <span class="game-date">Prototype</span>
        </div>
    </div>
</article>
```

**Verify:** Reload http://localhost:8000. All 11 game cards should render in the new horizontal layout with thumbnail left, mechanic tags, and white Play Game buttons. Hover a card — background should darken slightly and thumbnail should brighten. Check mobile at 375px width: cards should stack (thumbnail above, info below).

**Commit:**
```bash
git add games/
git commit -m "Replace game card feature lists with mechanic tag system"
```

---

## Task 4: Update about.html

Replace the `<style>` block and update the `<body>` markup in `about.html` to match the new type system. The content (bio text, game list, skills) is unchanged.

Replace the entire `<style>` block inside `<head>` with:

```html
<style>
    @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Inter:wght@400;500;600&display=swap');

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Inter', sans-serif;
        line-height: 1.6;
        color: rgba(255,255,255,0.5);
        background: #111214;
        padding: 2rem;
        -webkit-font-smoothing: antialiased;
    }

    .about-container {
        max-width: 800px;
        margin: 0 auto;
    }

    .about-header {
        display: flex;
        align-items: center;
        gap: 2rem;
        margin-bottom: 2rem;
    }

    .headshot {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        object-fit: cover;
        border: 1px solid rgba(255,255,255,0.08);
        flex-shrink: 0;
    }

    h1 {
        font-family: 'Barlow Condensed', sans-serif;
        font-weight: 800;
        font-size: 2.5rem;
        text-transform: uppercase;
        letter-spacing: -0.01em;
        line-height: 0.95;
        color: #ffffff;
        margin-bottom: 0.4rem;
    }

    .subtitle {
        font-size: 0.8rem;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        color: rgba(255,255,255,0.25);
    }

    .about-content {
        background: #18191C;
        padding: 1.5rem;
        border: 1px solid rgba(255,255,255,0.08);
        margin-bottom: 1.5rem;
    }

    .about-content p {
        color: rgba(255,255,255,0.5);
        margin-bottom: 1rem;
        font-size: 0.9rem;
        line-height: 1.75;
    }

    .about-content p:last-child { margin-bottom: 0; }

    .section {
        background: #18191C;
        padding: 1.5rem;
        border: 1px solid rgba(255,255,255,0.08);
        margin-bottom: 1.5rem;
    }

    .section h2 {
        font-family: 'Barlow Condensed', sans-serif;
        font-weight: 800;
        font-size: 1.2rem;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        color: #ffffff;
        margin-bottom: 1rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid rgba(255,255,255,0.08);
    }

    .games-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 1rem;
        margin-top: 0.5rem;
    }

    .game-card {
        background: #111214;
        padding: 1rem;
        border: 1px solid rgba(255,255,255,0.08);
    }

    .game-card h3 {
        font-family: 'Barlow Condensed', sans-serif;
        font-weight: 700;
        font-size: 1rem;
        text-transform: uppercase;
        color: #ffffff;
        margin-bottom: 0.25rem;
    }

    .game-card .company {
        font-size: 0.7rem;
        color: rgba(255,255,255,0.25);
        letter-spacing: 0.04em;
    }

    .game-card p {
        font-size: 0.8rem;
        color: rgba(255,255,255,0.4);
        line-height: 1.5;
    }

    .skills-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 1.5rem;
        margin-top: 0.5rem;
    }

    .skill-category h3 {
        font-family: 'Barlow Condensed', sans-serif;
        font-weight: 700;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        color: rgba(255,255,255,0.5);
        margin-bottom: 0.75rem;
    }

    .skill-category ul { list-style: none; }

    .skill-category li {
        font-size: 0.8rem;
        color: rgba(255,255,255,0.4);
        padding: 0.3rem 0 0.3rem 1rem;
        position: relative;
        line-height: 1.4;
    }

    .skill-category li::before {
        content: "—";
        position: absolute;
        left: 0;
        color: rgba(255,255,255,0.15);
    }

    @media (max-width: 600px) {
        .about-header {
            flex-direction: column;
            text-align: center;
        }
        h1 { font-size: 2rem; }
    }
</style>
```

**Verify:** Click "About" in the nav — the about modal should open showing the new type treatment. Name in Barlow Condensed, section headings in uppercase Barlow, body in Inter, square card corners.

**Commit:**
```bash
git add about.html
git commit -m "Apply new type system to about page"
```

---

## Final Check

Open http://localhost:8000 and run through this list:

1. Nav: "Solcalc" label on left, "About" and "LinkedIn ↗" buttons on right — border only, no fills
2. Hero: Large stacked "MASON / McELROY" in Barlow Condensed, white rule, muted tagline, stats row
3. Game list: "Prototype Collection" label + "11 games" count on the same line, separated by a rule
4. Cards: 4:3 thumbnail left, index + title + description + tags + Play button right
5. Card hover: background darkens, thumbnail brightens, right border lightens
6. Mobile (resize to 375px): cards stack, thumbnail on top, full-width
7. About modal: Barlow Condensed headings, Inter body, no color accent
8. Game modal: click Play Game on any card — game loads in the modal, close button works
