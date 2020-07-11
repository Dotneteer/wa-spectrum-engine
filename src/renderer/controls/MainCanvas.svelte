<script>
  import SplitContainer from "./SplitContainer.svelte";
  import EmulatorPanel from "./EmulatorPanel.svelte";
  import KeyboardPanel from "./KeyboardPanel.svelte";

  import { createRendererProcessStateAware } from "../rendererProcessStore";

  let keyboardVisible = false;
  const stateAware = createRendererProcessStateAware("keyboardPanelState");
  stateAware.onStateChanged.on(state => {
    keyboardVisible = state.visible;
  });

  let keyboardHeight;
  let initialHeight;
</script>

<style>
  .main-panel {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    flex-shrink: 1;
    height: 100%;
    width: 100%;
  }
</style>

<div class="main-panel">
  <SplitContainer
    direction="vertical"
    refreshTag={keyboardVisible}
    on:moved={() => (initialHeight = keyboardHeight)}>
    <EmulatorPanel />
    {#if keyboardVisible}
      <KeyboardPanel
        visible={keyboardVisible}
        {initialHeight}
        bind:sizedHeight={keyboardHeight} />
    {/if}
  </SplitContainer>
</div>
