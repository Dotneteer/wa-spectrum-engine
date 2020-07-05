<script>
  import Toolbar from "./controls/Toolbar.svelte"
  import Statusbar from "./controls/Statusbar.svelte"

  import { onDestroy } from "svelte";
  import { themeStore } from "./stores/theme-store";

  import { darkTheme } from "./themes/dark-theme";

  let themeStyle = "";
  let themeClass = "";

  const unsubscribe = themeStore.subscribe(theme => {
    let styleValue = "";
    for (const key in theme.properties) {
      styleValue += `${key}:${theme.properties[key]};`;
    }
    themeStyle = styleValue.trimRight();
    themeClass = `${theme.name}-theme`;
  });

  onDestroy(unsubscribe);

  themeStore.registerTheme(darkTheme);
  themeStore.setTheme("dark");
</script>

<style>
  main {
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    height: 100%;
    flex-shrink: 0;
    user-select: none;
    background-color: var(--shell-canvas-background-color);
    outline: none;
  }

  .main-panel {
    display: flex;
    flex-direction: row;
    flex-grow: 1;
    flex-shrink: 1;
    height: 100%;
    width: 100%;
  }
</style>

<main style={themeStyle} class={themeClass} tabindex="0">
  <Toolbar></Toolbar>
  <div class="main-panel">
  </div>
  <Statusbar></Statusbar>
</main>
