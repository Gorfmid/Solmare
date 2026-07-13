(function () {
  "use strict";

  const contentEl = document.getElementById("content");
  const navEl = document.getElementById("nav");
  const crumbsEl = document.getElementById("crumbs");
  const searchEl = document.getElementById("search");
  const openRawEl = document.getElementById("open-raw");
  const btnBrowse = document.getElementById("btn-browse");

  let catalog = [];
  let currentPath = null;

  /** Resolve repo-root path for fetch. Wiki is served from /Wiki/ with server at repo root. */
  function assetUrl(path) {
    if (!path) return "";
    const clean = path.replace(/^\/+/, "");
    return "../" + clean;
  }

  function hashPath() {
    const h = location.hash.replace(/^#\/?/, "");
    return decodeURIComponent(h);
  }

  function setHash(path) {
    location.hash = "#/" + path;
  }

  function renderNav() {
    const nav = window.SOLMARE_NAV || [];
    navEl.innerHTML = "";
    nav.forEach((section) => {
      const wrap = document.createElement("div");
      wrap.className = "nav-section" + (section.open ? "" : " collapsed");
      wrap.dataset.id = section.id;

      const btn = document.createElement("button");
      btn.type = "button";
      btn.textContent = section.title;
      btn.addEventListener("click", () => wrap.classList.toggle("collapsed"));
      wrap.appendChild(btn);

      const ul = document.createElement("ul");
      section.links.forEach((link) => {
        const li = document.createElement("li");
        const a = document.createElement("a");
        a.href = "#/" + link.path;
        a.textContent = link.label;
        a.dataset.path = link.path;
        li.appendChild(a);
        ul.appendChild(li);
      });
      wrap.appendChild(ul);
      navEl.appendChild(wrap);
    });
  }

  function markActive(path) {
    navEl.querySelectorAll("a").forEach((a) => {
      a.classList.toggle("active", a.dataset.path === path);
      if (a.dataset.path === path) {
        const section = a.closest(".nav-section");
        if (section) section.classList.remove("collapsed");
      }
    });
  }

  function renderCrumbs(path) {
    if (!path) {
      crumbsEl.innerHTML = "Home";
      return;
    }
    const parts = path.split("/");
    let acc = [];
    const bits = ['<a href="#/">Home</a>'];
    parts.forEach((p, i) => {
      acc.push(p);
      const full = acc.join("/");
      if (i === parts.length - 1) {
        bits.push("<span>" + escapeHtml(p) + "</span>");
      } else {
        bits.push('<span class="sep"> / </span>');
        // folder crumbs are not pages — skip links for intermediate folders
        bits.push("<span>" + escapeHtml(p) + "</span>");
      }
    });
    // rebuild: Home / path display
    crumbsEl.innerHTML =
      '<a href="#/">Home</a> <span class="sep">/</span> <code style="font-size:0.85em;color:var(--muted)">' +
      escapeHtml(path) +
      "</code>";
  }

  function escapeHtml(s) {
    return String(s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function rewriteMdLinks(html, basePath) {
    const baseDir = basePath.includes("/")
      ? basePath.slice(0, basePath.lastIndexOf("/") + 1)
      : "";
    const div = document.createElement("div");
    div.innerHTML = html;
    div.querySelectorAll("a[href]").forEach((a) => {
      const href = a.getAttribute("href") || "";
      if (
        href.startsWith("http") ||
        href.startsWith("#") ||
        href.startsWith("mailto:")
      ) {
        return;
      }
      let target = href.replace(/^\.\//, "");
      if (target.startsWith("../")) {
        const stack = baseDir.split("/").filter(Boolean);
        const parts = target.split("/");
        parts.forEach((part) => {
          if (part === "..") stack.pop();
          else if (part !== ".") stack.push(part);
        });
        target = stack.join("/");
      } else if (!target.startsWith("/")) {
        target = baseDir + target;
      } else {
        target = target.replace(/^\//, "");
      }
      if (/\.md($|#)/i.test(target)) {
        const [file, hash] = target.split("#");
        a.setAttribute("href", "#/" + file + (hash ? "#" + hash : ""));
      }
    });
    return div.innerHTML;
  }

  async function loadMarkdown(path) {
    currentPath = path;
    markActive(path);
    renderCrumbs(path);
    contentEl.innerHTML = '<p class="loading">Loading…</p>';
    openRawEl.hidden = false;
    openRawEl.href = assetUrl(path);

    try {
      const res = await fetch(assetUrl(path));
      if (!res.ok) throw new Error(res.status + " " + res.statusText);
      const text = await res.text();
      let html = marked.parse(text, { mangle: false, headerIds: true });
      html = rewriteMdLinks(html, path);
      contentEl.innerHTML = html;
      contentEl.querySelectorAll("a[href^='#/']").forEach((a) => {
        a.addEventListener("click", (e) => {
          // allow hash navigation
        });
      });
      window.scrollTo(0, 0);
    } catch (err) {
      contentEl.innerHTML =
        '<p class="error">Could not load <code>' +
        escapeHtml(path) +
        '</code>.</p><p class="error">' +
        escapeHtml(String(err.message || err)) +
        '</p><p>Make sure you started the local server from the <strong>repo root</strong> (see Wiki/README.md).</p>';
    }
  }

  function renderHome() {
    currentPath = null;
    markActive(null);
    renderCrumbs(null);
    openRawEl.hidden = true;

    const cards = (window.SOLMARE_HOME_CARDS || [])
      .map(
        (c) =>
          '<a class="home-card" href="#/' +
          c.path +
          '"><h3>' +
          escapeHtml(c.title) +
          "</h3><p>" +
          escapeHtml(c.blurb) +
          "</p></a>"
      )
      .join("");

    contentEl.innerHTML =
      "<h1>Solmare Series Wiki</h1>" +
      "<p>Internal production reference for <em>The Solmare Cycle</em>. Browse organized canon, Book One chapters and notes, Book Two planning, and craft docs.</p>" +
      '<p style="color:var(--muted);font-size:0.9rem">History creates civilizations. Civilizations create doctrine. Doctrine creates decisions. Decisions create conflict.</p>' +
      '<div class="home-grid">' +
      cards +
      "</div>" +
      "<h2>How to use</h2>" +
      "<ul>" +
      "<li>Use the left nav for curated links.</li>" +
      "<li>Search by filename or path.</li>" +
      "<li>Browse all files for the full 280+ markdown catalog.</li>" +
      "<li>Markdown links between files open inside this wiki when possible.</li>" +
      "</ul>";
  }

  function renderBrowse(filter) {
    const q = (filter || "").trim().toLowerCase();
    let files = catalog.slice();
    if (q) {
      files = files.filter((f) => f.toLowerCase().includes(q));
    }
    renderCrumbs(null);
    openRawEl.hidden = true;
    markActive(null);

    const list = files
      .map(
        (f) =>
          '<li><a href="#/' + f + '">' + escapeHtml(f) + "</a></li>"
      )
      .join("");

    contentEl.innerHTML =
      '<div class="search-results"><h1>All markdown files</h1>' +
      "<p>" +
      files.length +
      " of " +
      catalog.length +
      " files" +
      (q ? ' matching “' + escapeHtml(q) + '”' : "") +
      ".</p>" +
      '<ul class="file-list">' +
      list +
      "</ul></div>";
  }

  async function loadCatalog() {
    try {
      const res = await fetch("catalog.json");
      catalog = await res.json();
    } catch (_) {
      catalog = [];
    }
  }

  function route() {
    const path = hashPath();
    if (!path || path === "home") {
      searchEl.value = "";
      renderHome();
      return;
    }
    if (path === "browse" || path.startsWith("browse?")) {
      renderBrowse(searchEl.value);
      return;
    }
    if (path.endsWith(".md") || path.includes(".md#")) {
      const file = path.split("#")[0];
      loadMarkdown(file);
      return;
    }
    contentEl.innerHTML =
      '<p class="error">Unknown route.</p><p><a href="#/">Back home</a></p>';
  }

  searchEl.addEventListener("input", () => {
    const q = searchEl.value.trim();
    if (!q) {
      if (hashPath() === "browse") renderBrowse("");
      return;
    }
    // live search across catalog
    if (!catalog.length) return;
    const matches = catalog.filter((f) =>
      f.toLowerCase().includes(q.toLowerCase())
    );
    openRawEl.hidden = true;
    renderCrumbs(null);
    contentEl.innerHTML =
      '<div class="search-results"><h1>Search</h1><p>' +
      matches.length +
      " matches for “" +
      escapeHtml(q) +
      '”</p><ul class="file-list">' +
      matches
        .slice(0, 200)
        .map(
          (f) =>
            '<li><a href="#/' + f + '">' + escapeHtml(f) + "</a></li>"
        )
        .join("") +
      "</ul></div>";
  });

  btnBrowse.addEventListener("click", () => {
    searchEl.value = "";
    setHash("browse");
  });

  window.addEventListener("hashchange", route);

  renderNav();
  loadCatalog().then(route);
})();
