<script>
  import { onMount } from "svelte";
  import { createRendererProcessStateAware } from "../rendererProcessStore";
  import { emulatorSetZoomAction } from "../../shared/state/redux-emulator-state";
  import { getSpectrumEngine } from "../spectrum-loader";

  const stateAware = createRendererProcessStateAware("emulatorPanelState");
  let spectrum;
  let frameCount = 0;

  let width = 0;
  let height = 0;

  let canvasWidth;
  let canvasHeight;

  let screen;
  let shadowScreen;

  let clientWidth;
  let clientHeight;
  let emulatorStyle;

  onMount(async () => {
    spectrum = await getSpectrumEngine();
    spectrum.screenRefreshed.on(onScreenRefreshed);
    width = spectrum.screenWidth;
    height = spectrum.screenHeight;
    calculateDimensions(clientWidth, clientHeight, width, height);
    configureScreen();
  });

  // --- Respond to panel size changes
  $: {
    calculateDimensions(clientWidth, clientHeight, width, height);
  }

  let imageBuffer;
  let imageBuffer8;
  let pixelData;

  // --- Configures the screen
  function configureScreen() {
    const dataLen = width * height * 4;
    imageBuffer = new ArrayBuffer(dataLen);
    imageBuffer8 = new Uint8Array(imageBuffer);
    pixelData = new Uint32Array(imageBuffer);
  }

  // --- Calculates screen dimensions
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

    if (!shadowScreen || !screen) return;
    shadowScreen.width = width;
    shadowScreen.height = height;
    const shadowCtx = shadowScreen.getContext("2d");
    if (shadowCtx) {
      shadowCtx.canvas.width = width;
      shadowCtx.canvas.height = height;
    }
    const screenCtx = screen.getContext("2d");
    if (screenCtx) {
      screenCtx.canvas.width = width * ratio;
      screenCtx.canvas.height = height * ratio;
    }
  }

  function onScreenRefreshed() {
    frameCount++;
    displayScreenData();
    const state = spectrum.spectrum.getMachineState();
    //console.log(`pc: ${state.pc}, hl: ${state.hl}`);
  }

  function displayScreenData() {
    const shadowCtx = shadowScreen.getContext("2d");
    if (!shadowCtx) return;
    const shadowImageData = shadowCtx.getImageData(
      0,
      0,
      shadowScreen.width,
      shadowScreen.height
    );
    const screenCtx = screen.getContext("2d");
    let j = 0;

    const screenData = spectrum.getScreenData();
    for (let i = 0; i < width * height; i++) {
      pixelData[j++] = screenData[i];
    }
    shadowImageData.data.set(imageBuffer8);
    shadowCtx.putImageData(shadowImageData, 0, 0);
    if (screenCtx) {
      screenCtx.imageSmoothingEnabled = false;
      screenCtx.drawImage(shadowScreen, 0, 0, screen.width, screen.height);
    }
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
