<script>
  import { onMount } from "svelte";
  import { createRendererProcessStateAware } from "../rendererProcessStore";
  import { emulatorSetZoomAction } from "../../shared/state/redux-emulator-state";
  import { queryScreenSize } from "../../shared/messaging/message-senders"

  const stateAware = createRendererProcessStateAware("emulatorPanelState");

  let width = 500;
  let height = 100;

  let canvasWidth;
  let canvasHeight;

  let screen;
  let shadowScreen;

  let clientWidth;
  let clientHeight;
  let emulatorStyle;

  onMount(async () => {
    console.log(`Screen size: `)
    const response = await queryScreenSize();
    width = response.width;
    height = response.height;
    calculateDimensions(clientWidth, clientHeight, width, height);
  });
  $: {
    calculateDimensions(clientWidth, clientHeight, width, height);
  }

  function calculateDimensions(clientWidth, clientHeight, width, height) {
    const widthRatio = Math.floor(clientWidth / width);
    if (widthRatio < 1) widthRatio = 1;
    const heightRatio = Math.floor(clientHeight / height);
    if (heightRatio < 1) heightRatio = 1;
    const ratio = Math.min(widthRatio, heightRatio);
    stateAware.dispatch(emulatorSetZoomAction(ratio)());
    canvasWidth = width * ratio;
    canvasHeight = height * ratio;
    emulatorStyle = `width:${canvasWidth}px; height:${canvasHeight}px`;
  }
</script>

<style>
  .emulator-panel {
    display: flex;
    overflow: hidden;
    flex-shrink: 1;
    flex-grow: 1;
    height: 100%;
    width: 100%;
    padding: 8px 12px;
    background-color: var(--emulator-background-color);
    box-sizing: border-box;
    align-content: start;
    justify-items: start;
    justify-content: center;
    align-items: center;
  }

  .emulator-screen {
    background-color: yellow;
  }
</style>

<div class="emulator-panel" bind:clientWidth bind:clientHeight>
  <div class="emulator-screen" style={emulatorStyle}>
    <canvas bind:this={screen} />
    <canvas bind:this={shadowScreen} style="display:none" />
  </div>
</div>
