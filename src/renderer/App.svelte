<script>
  import Toolbar from "./controls/Toolbar.svelte";
  import Statusbar from "./controls/Statusbar.svelte";
  import SplitContainer from "./controls/SplitContainer.svelte";
  import EmulatorPanel from "./controls/EmulatorPanel.svelte";
  import KeyboardPanel from "./controls/KeyboardPanel.svelte";

  import { onDestroy } from "svelte";
  import { themeStore } from "./stores/theme-store";
  import { createRendererProcessStateAware } from "./rendererProcessStore";

  import { darkTheme } from "./themes/dark-theme";

  // --- Manage themes and theme changes
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

  // --- Manage application state changes
  let keyboardVisible = false;
  const stateAware = createRendererProcessStateAware();
  stateAware.onStateChanged.on(state => {
    keyboardVisible = state.keyboardVisible;
    console.log(`Keyboard visible: ${keyboardVisible}`)
  });
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
    flex-direction: column;
    flex-grow: 1;
    flex-shrink: 1;
    height: 100%;
    width: 100%;
  }
</style>

<main style={themeStyle} class={themeClass} tabindex="0">
  <Toolbar />
  <div class="main-panel">
    <SplitContainer direction="vertical">
      <EmulatorPanel />
      <KeyboardPanel visible={keyboardVisible} />
    </SplitContainer>
  </div>
  <Statusbar />
</main>
